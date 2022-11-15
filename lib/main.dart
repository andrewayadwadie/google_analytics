import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/analytics_controller.dart';
import 'core/route_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  AnalyticsController analyticsCtrl = Get.put(AnalyticsController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Noor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [analyticsCtrl.getAnalyticsObserver()],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.homeScreen,
    );
  }
}
