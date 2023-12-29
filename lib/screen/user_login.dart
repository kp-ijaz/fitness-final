import 'package:flutter/material.dart';
import 'package:homeworkout/user_screen/user_main_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Headpage extends StatelessWidget {
  Headpage({super.key});
  final formKey = GlobalKey<FormState>();
  final _usenamController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 95, 95, 95),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
            child: Center(
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
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 150, right: 25, left: 25),
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          controller: _usenamController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a name';
                            } else if (value.length <= 2) {
                              return 'Enter a valid name';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFFFFFFF),
                                  style: BorderStyle.solid),
                            ),
                            labelText: 'Enter your name',
                            labelStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              var _sharedPrifrence =
                                  await SharedPreferences.getInstance();
                              _sharedPrifrence.setString(
                                  'user', _usenamController.text);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => const UserMainHome()));
                            }
                          },
                          child: const Text("Let's start")),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 95, 95),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color.fromARGB(160, 0, 0, 0))),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => const UserMainHome()));
                },
                child: const Text('Skip')),
          ),
        ],
      ),
    );
  }
}
