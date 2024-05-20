import 'package:flutter/material.dart';

class RegisterPageEmailField extends StatelessWidget {
  static const _borderRadius = 10.0, _textFieldPercent = 0.8;
  static const _hintText = 'Email';
  const RegisterPageEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * _textFieldPercent,
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
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

class RegisterPagePasswordField extends StatelessWidget {
  static const _borderRadius = 10.0, _textFieldPercent = 0.8;
  static const _hintText = 'Password', _obscureCharacter = '#';
  static const _iconTapRadius = 50.0;
  const RegisterPagePasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    bool isObscure = true;
    return SizedBox(
      width: width * _textFieldPercent,
      child: Center(
        child: StatefulBuilder(
          builder: (context, setState) {
            return TextFormField(
              keyboardType: TextInputType.visiblePassword,
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

class RegisterPageConfirmPasswordField extends StatelessWidget {
  static const _borderRadius = 10.0, _textFieldPercent = 0.8;
  static const _hintText = 'Confirm Password', _obscureCharacter = '#';
  static const _iconTapRadius = 50.0;
  const RegisterPageConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    bool isObscure = true;
    return SizedBox(
      width: width * _textFieldPercent,
      child: Center(
        child: StatefulBuilder(
          builder: (context, setState) {
            return TextFormField(
              keyboardType: TextInputType.visiblePassword,
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
