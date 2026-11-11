import 'package:flutter/material.dart';
import 'package:my_first_app/socmed/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm ({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late String errorMessage;
  late bool isError;

  @override
  void dispose() {
    super.dispose();
  }

  void checkLogin(username, password) {
    setState(() {
      if (username == ""){
        errorMessage = "Username cannot be empty";
        isError = true;
      } else if (password == ""){ 
        errorMessage = "Password cannot be empty";
        isError = true;
      } else {
        errorMessage = "";
        isError = false;
      }
    });
  }
  


  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(

      
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/soc_med/soc_med_logo.jpg',
                    width: 48, 
                    height: 48,
                  ),
                  const SizedBox(width: 12),
                  Text('Nexora', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 15),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: buttonStyle.copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  checkLogin(_usernameController.text, _passwordController.text);
                  if (!isError) {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SocialMedia()),
                    );
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage)),
                    );
                  }
                 
                },
                child: const Text('Login'),

              ),
            ]
          )

        )
      )
    );
  }
}