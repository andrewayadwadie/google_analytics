import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setUserProperties(userId: '123456', userRole: 'Admin');
    logLogin();
  }

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  //! this method know us user identity
  Future setUserProperties(
      {required String userId, required String userRole}) async {
    await _analytics.setUserId(id: userId);
    await _analytics.setUserProperty(name: 'user_role', value: userRole);
  }

  //! method for login log
  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

//! method for SignUp log
  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

//! we will use this method in main view for test
  Future logNavigateToScreenOne({required String color}) async {
    await _analytics.logEvent(
      name: 'go_to_screen_one',
      parameters: {'button_color': color},
    );
    log("logNavigateToScreenOne excuted");
  }

  Future logNavigateToScreenTwo({required String color}) async {
    await _analytics.logEvent(
      name: 'go_to_screen_two',
      parameters: {'button_color': color},
    );
    log("logNavigateToScreenTwo excuted");
  }
}
