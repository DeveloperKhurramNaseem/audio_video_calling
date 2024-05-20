import 'package:audio_video_calling/flow/login_page/controller/login_page_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageEmailField extends ConsumerWidget {
  static const _borderRadius = 10.0, _textFieldPercent = 0.8;
  static const _hintText = 'Email';
  const LoginPageEmailField({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var notifier = ref.read(loginPageStateNotifierProvider.notifier);
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * _textFieldPercent,
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: notifier.emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
            helperText: '',
            hintText: _hintText,
          ),
        ),
      ),
    );
  }
}

class LoginPagePasswordField extends ConsumerWidget {
  static const _borderRadius = 10.0, _textFieldPercent = 0.8;
  static const _hintText = 'Password', _obscureCharacter = '#';
  static const _iconTapRadius = 50.0;
  const LoginPagePasswordField({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var notifier = ref.read(loginPageStateNotifierProvider.notifier);
    final width = MediaQuery.sizeOf(context).width;
    bool isObscure = true;
    return SizedBox(
      width: width * _textFieldPercent,
      child: Center(
        child: StatefulBuilder(
          builder: (context, setState) {
            return TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: notifier.passwordController,
              obscureText: isObscure,
              obscuringCharacter: _obscureCharacter,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                suffixIcon: InkWell(
                  borderRadius: BorderRadius.circular(_iconTapRadius),
                  onTap: () {
                    setState(() => isObscure = !isObscure);
                  },
                  child: isObscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),
                helperText: '',
                hintText: _hintText,
              ),
            );
          },
        ),
      ),
    );
  }
}
