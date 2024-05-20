import 'package:audio_video_calling/flow/login_page/view/login_page.dart';
import 'package:audio_video_calling/navigation/route_generation.dart';
import 'package:audio_video_calling/utils/app_theme/color_theme.dart';
import 'package:audio_video_calling/utils/app_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const _appTitle = 'Audio Video Calling';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: _appTitle,
        darkTheme: ThemeData(
          colorScheme: AppColorTheme.darkColorScheme,
          textTheme: AppTextTheme.darkTextTheme,
          useMaterial3: true,
        ),
        theme: ThemeData(
          colorScheme: AppColorTheme.lightColorScheme,
          textTheme: AppTextTheme.lightTextTheme,
          useMaterial3: true,
        ),
        onGenerateRoute: RouteGeneration.onGenerateRoute,
        initialRoute: LoginPage.pageName,
      ),
    );
  }
}
