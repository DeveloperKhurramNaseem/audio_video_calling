
import 'package:audio_video_calling/utils/app_theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageForgetPassword extends ConsumerWidget {
  static const _forgetPasswordText = 'Forget Password';
  static const _widthPercent = 0.8, _decorationThickness = 1.0;
  static const _padding = 5.0 , _borderRadius = 10.0;
  const LoginPageForgetPassword({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * _widthPercent,
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            
          },
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Text(
              _forgetPasswordText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColorTheme.primaryColor,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColorTheme.primaryColor,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: _decorationThickness,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
