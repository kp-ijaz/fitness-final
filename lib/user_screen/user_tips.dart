import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/tips_db.dart';
import 'package:homeworkout/db%20model/tips_model.dart';
import 'package:homeworkout/screen/category/tips.dart';

class Usertips extends StatelessWidget {
  Usertips({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          title: const Text('TIPS'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: TipsDB().urlListNotifier,
                  builder:
                      (BuildContext ctx, List<TipsModal> newList, Widget? _) {
                    return ListView.separated(
                        itemBuilder: (ctx, index) {
                          final value = newList[index];
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx1) => Tipspage(
                                        url: value.urlName!,
                                      )));
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Text(
                                value.name.toString(),
                                style: const TextStyle(color: Colors.amber),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider();
                        },
                        itemCount: newList.length);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
