import 'package:flutter/material.dart';
import 'package:homeworkout/screen/admin_or_user.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        title: const Text('SETTINGS'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.amber,
                    size: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Share with friends',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Rate us',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_rounded,
                      color: Colors.amber,
                      size: 40.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Feedback',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                    color: Colors.amber,
                    iconSize: 40.0,
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      final result = showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text('You are logging out'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Admin_user_page()),
                                    (route) => false);
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      final result = showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text('You are logging out'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Admin_user_page()),
                                    (route) => false);
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
