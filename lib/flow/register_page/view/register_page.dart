import 'package:audio_video_calling/flow/register_page/widgets/register_page_buttons.dart';
import 'package:audio_video_calling/flow/register_page/widgets/register_page_footer.dart';
import 'package:audio_video_calling/flow/register_page/widgets/register_page_input_fields.dart';
import 'package:audio_video_calling/flow/register_page/widgets/register_page_title.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const pageName = '/registerpage';
  static const _titleFlex = 14,
      _inputFieldsFlex = 13,
      _footerFlex = 27,
      _btnFlex = 10;
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: _titleFlex,
                child: RegisterPageTitle(),
              ),
              Expanded(
                flex: _inputFieldsFlex,
                child: RegisterPageUsernameField(),
              ),
              Expanded(
                flex: _inputFieldsFlex,
                child: RegisterPageEmailField(),
              ),
              Expanded(
                flex: _inputFieldsFlex,
                child: RegisterPagePasswordField(),
              ),
              Expanded(
                flex: _btnFlex,
                child: RegisterPageRegisterButton(),
              ),
              Expanded(
                flex: _btnFlex,
                child: RegisterPageCancelButton(),
              ),
              Expanded(
                flex: _footerFlex,
                child: RegisterPageFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
