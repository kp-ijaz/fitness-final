import 'package:flutter/material.dart';
import 'package:homeworkout/screen/admin_login.dart';
import 'package:homeworkout/screen/user_login.dart';

class Admin_user_page extends StatelessWidget {
  const Admin_user_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 209, 205, 193),
                  ),
                  height: 500,
                  width: double.infinity,
                  child: Column(children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 50,
                          ),
                          child: Text(
                            'WELCOME',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          'To my app',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Text(
                        'LOGIN AS',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Adminlogin()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.cyan[300],
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/admin.png',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Headpage()));
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/fitnes9.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('ADMIN'),
                        ),
                        TextButton(onPressed: () {}, child: const Text('USER'))
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
