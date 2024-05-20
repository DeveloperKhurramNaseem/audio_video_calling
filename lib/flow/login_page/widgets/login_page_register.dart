import 'package:audio_video_calling/flow/register_page/view/register_page.dart';
import 'package:audio_video_calling/utils/app_theme/color_theme.dart';
import 'package:flutter/material.dart';

class LoginPageRegister extends StatelessWidget {
  static const _widthPercent = 0.8, _decorationThickness = 1.0;
  static const _padding = 5.0, _borderRadius = 10.0;
  static const _notAUserText = 'Not A User ',
      _registerText = 'Register Yourself';
  const LoginPageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * _widthPercent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            _notAUserText,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RegisterPage.pageName);
            },
            borderRadius: BorderRadius.circular(_borderRadius),
            child: Padding(
              padding: const EdgeInsets.all(_padding),
              child: Text(
                _registerText,
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
        ],
      ),
    );
  }
}
