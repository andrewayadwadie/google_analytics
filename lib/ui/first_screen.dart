import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/realtime_daatabase.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  RealtimeDataBase db = Get.put(RealtimeDataBase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "First Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: InkWell(
            onTap: () {
              db.setDataToUser();
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Click Here",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
