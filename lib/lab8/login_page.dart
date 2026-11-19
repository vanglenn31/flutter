import 'package:flutter/material.dart';
import 'package:my_first_app/lab8/register.dart';
import 'package:my_first_app/lab8/auth_service.dart';
import 'package:my_first_app/lab8/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService auth = AuthService();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool loading = false;
  bool resetLoading = false;

  // Forgot Password
  Future<void> resetPassword() async {
    String email = emailCtrl.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email address.")),
      );
      return;
    }

    setState(() => resetLoading = true);

    final success = await auth.forgotPassword(email);

    if (!mounted) return;

    setState(() => resetLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? "Password reset link sent! Please check your email."
              : "Unable to send reset link. Please check your email.",
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrina Login")),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Email
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 12),

              // Password
              TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: resetLoading ? null : resetPassword,
                  child: resetLoading
                      ? CircularProgressIndicator()
                      : Text("Forgot Password?"),
                ),
              ),

              SizedBox(height: 12),

              // Email Login
              ElevatedButton(
                child: loading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login with Email'),
                onPressed: loading
                    ? null
                    : () async {
                        setState(() => loading = true);

                        final user = await auth.signInWithEmail(
                          emailCtrl.text.trim(),
                          passwordCtrl.text,
                        );

                        if (!mounted) return;

                        setState(() => loading = false);

                        if (user != null) {
                          if (!user.emailVerified) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please verify your email before logging in.",
                                ),
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid email or password"),
                            ),
                          );
                        }
                      },
              ),

              SizedBox(height: 24),

              // OR Divider
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 24),

              // Google Login
              ElevatedButton.icon(
                icon: Icon(Icons.login),
                label: Text("Sign in with Google"),
                onPressed: loading
                    ? null
                    : () async {
                        setState(() => loading = true);

                        final user = await auth.signInWithGoogle();

                        if (!mounted) return;

                        setState(() => loading = false);

                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomePage(),
                            ),
                          );
                        }
                      },
              ),

              SizedBox(height: 12),

              // Register
              TextButton(
                child: Text("Don't have an account? Register"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegisterPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
