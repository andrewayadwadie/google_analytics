import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import '../controller/analytics_controller.dart';

import '../core/route_manager.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AnalyticsController analyticsController = Get.put(AnalyticsController());
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      log("url is : $url}");
      if (url == "https://pub.dev/packages/flutter_webview_plugin/changelog") {
        flutterWebviewPlugin.close();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: InkWell(
                onTap: () async {
                  await analyticsController.logNavigateToScreenOne(
                      color: "green");
                  Get.toNamed(Routes.firstScreen);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Go To Screen 1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () async {
                await analyticsController.logNavigateToScreenTwo(
                    color: "yellow");
                Get.toNamed(Routes.secondScreen);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Go To Screen 2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: InkWell(
              onTap: () {
                flutterWebviewPlugin.launch(
                  "https://pub.dev/packages/flutter_webview_plugin",
                  rect: Rect.fromLTWH(
                    0.0,
                    0.0,
                    MediaQuery.of(context).size.width,
                    300.0,
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Go To Screen 2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
