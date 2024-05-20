import 'package:audio_video_calling/utils/app_theme/color_theme.dart';
import 'package:audio_video_calling/utils/app_theme/text_theme.dart';
import 'package:flutter/material.dart';

class RegisterPageTitle extends StatelessWidget {
  static const _fontSizePercent = 0.4;
  static const _title = 'Register';
  const RegisterPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            AppColorTheme.primaryColor,
            AppColorTheme.tertiaryColor,
          ],
        ).createShader(bounds),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Text(
              _title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppTextTheme.secondaryTextColor,
                    letterSpacing: 1,
                    fontSize: constraints.maxHeight * _fontSizePercent,
                  ),
            );
          },
        ),
      ),
    );
  }
}