import 'package:flutter/material.dart';
import 'package:whatsapp/Auth_Servies/AuthServies.dart';
import 'package:whatsapp/Screens/HomePage/Homepage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:whatsapp/Auth_Servies/AuthServies.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false; // To show loading state
    final AuthServices _authServices = AuthServices();
    return Scaffold(
      body: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/LoginPage-removebg-preview.png",
                height: 300,
                width: 300,
              ),
              SizedBox(height: 20),
              Text(
                "Wellcome to WhatsApp",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                    ),
                    onPressed: () async {
                      setState(() => isLoading = true);
                      final res = await _authServices.SigninWithGoogle();
                        if (res != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Google Login failed.')),
                        );
                      }
                      setState(() => isLoading = false);
                    },
                    child: Text("Google SignIn")),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                    ),
                    onPressed: () async {
                      setState(() => isLoading = true);
                      final res = await _authServices.SigninWithGitHub();
                      if (res != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('GitHub Login failed.')),
                        );
                      }
                      setState(() => isLoading = false);
                    },
                    child: Text("SignIn GitHub")),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
