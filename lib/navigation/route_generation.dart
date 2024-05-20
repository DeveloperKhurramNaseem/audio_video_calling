import 'package:audio_video_calling/flow/home_page/view/home_page.dart';
import 'package:audio_video_calling/flow/login_page/view/login_page.dart';
import 'package:audio_video_calling/flow/register_page/view/register_page.dart';
import 'package:audio_video_calling/utils/error_handling/error_page.dart';
import 'package:flutter/cupertino.dart';

class RouteGeneration {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      LoginPage.pageName => CupertinoPageRoute(
          builder: (context) => const LoginPage(), settings: settings),
      RegisterPage.pageName => CupertinoPageRoute(
          builder: (context) => const RegisterPage(), settings: settings),
      HomePage.pageName => CupertinoPageRoute(
          builder: (context) => const HomePage(), settings: settings),
      _ => CupertinoPageRoute(
          builder: (context) => const ErrorPage(),
        ),
    };
  }
}
