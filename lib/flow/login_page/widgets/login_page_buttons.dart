import 'package:audio_video_calling/utils/app_theme/color_theme.dart';
import 'package:audio_video_calling/utils/app_theme/text_theme.dart';
import 'package:flutter/material.dart';

class LoginPageLoginButton extends StatelessWidget {
  static const _btnText = 'Login';
  static const _bodyWidthPercent = 0.8, _veticalPadding = 0.15;
  static const _fontSizePercent = 0.3, _letterSpacing = 2.0;
  const LoginPageLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * _veticalPadding),
        child: SizedBox(
          width: width * _bodyWidthPercent,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed) ||
                      states.contains(MaterialState.focused)) {
                    return AppColorTheme.primaryColor.shade300;
                  } else {
                    return AppColorTheme.primaryColor;
                  }
                },
              ),
              foregroundColor: MaterialStateColor.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppTextTheme.secondaryTextColor;
                  }
                  return AppTextTheme.secondaryTextColor;
                },
              ),
            ),
            child: Text(
              _btnText,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppTextTheme.secondaryTextColor,
                  letterSpacing: _letterSpacing,
                  fontSize: constraints.maxHeight * _fontSizePercent),
            ),
          ),
        ),
      );
    });
  }
}
