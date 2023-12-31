import 'package:flutter/material.dart';
import 'package:homeworkout/btmnavigation.dart';

class Adminlogin extends StatelessWidget {
  Adminlogin({super.key});

  final formKey = GlobalKey<FormState>();
  final _adminmailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 95, 95),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Container(
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 0, 0, 0),
                image: const DecorationImage(
                  opacity: 150.0,
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/Screenshot 2023-10-20 162513.png'),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 100, right: 25, left: 25),
                      child: TextFormField(
                        controller: _adminmailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter mail';
                          } else if (value != 'admin@gmail.com') {
                            return 'Please enter a valid mail';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                style: BorderStyle.solid),
                          ),
                          labelText: 'Enter your e-mail',
                          labelStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 25, left: 25),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the password';
                          } else if (value != '12345678') {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                style: BorderStyle.solid),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Checklogin(context);
                            }
                          },
                          child: const Text("Log in")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void Checklogin(BuildContext context) {
    final adminmail = _adminmailController.text;
    final pass = _passwordController.text;
    if (adminmail == 'admin@gmail.com' && pass == '12345678') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Fluidbottom()));
    }
  }
}
