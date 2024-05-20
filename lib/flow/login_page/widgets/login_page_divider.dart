// The Divider with OR text written in between
import 'package:flutter/material.dart';

class LoginPageOrDivider extends StatelessWidget {
  static const _dividerFlex = 4, _textFlex = 1;
  static const _text = 'OR';
  static const _bodyWidthPercent = 0.8;
  const LoginPageOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * _bodyWidthPercent,
      child: const Row(
        children: [
          Expanded(
            flex: _dividerFlex,
            child: Divider(),
          ),
          Expanded(
            flex: _textFlex,
            child: Align(
              alignment: Alignment.center,
              child: Text(_text),
            ),
          ),
          Expanded(
            flex: _dividerFlex,
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
