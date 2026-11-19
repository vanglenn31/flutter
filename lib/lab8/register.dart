import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/lab8/login_page.dart';
import 'package:my_first_app/lab8/auth_service.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService auth = AuthService();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrina Register")),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: "Email;",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12,),
             TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                labelText: "Password;",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              child: loading ? CircularProgressIndicator(color: Colors.white)
              : Text('Register'),
              onPressed: () async {
                if(emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) return;
                setState(() => loading =true);

                final user = await auth.registerWithEmail(
                  emailCtrl.text, passwordCtrl.text);

                setState(() => loading= false);

                if (user != null) {
                  await user.sendEmailVerification();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Verifaction email sent. Please check tour inbox.")),
                  );
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (_) => LoginPage()));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Register failed")),
                  );
                }
              },
            ),
            SizedBox(height: 12,),
            TextButton(
              child: Text("Already have an account? Login"),
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_)=> LoginPage()));
              },
            )
            ],
          ),
        ),
      ),
    );
  }
}