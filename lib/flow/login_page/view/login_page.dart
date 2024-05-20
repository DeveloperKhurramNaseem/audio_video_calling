import 'package:audio_video_calling/flow/login_page/widgets/login_page_auth_providers.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_buttons.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_divider.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_footer.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_forget_password.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_input_fields.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_register.dart';
import 'package:audio_video_calling/flow/login_page/widgets/login_page_title.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const pageName = '/loginpage';
  static const _titleFlex = 14,
      _inputFieldsFlex = 13,
      _forgetPasswordFlex = 4,
      _loginBtnFlex = 10,
      _dividerFlex = 8,
      _authProvidersFlex = 8,
      _registerFlex = 4,
      _footerFlex = 26;
  const LoginPage({super.key});

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
                child: LoginPageTitle(),
              ),
              Expanded(
                flex: _inputFieldsFlex,
                child: LoginPageEmailField(),
              ),
              Expanded(
                flex: _inputFieldsFlex,
                child: LoginPagePasswordField(),
              ),
              Expanded(
                flex: _forgetPasswordFlex,
                child: LoginPageForgetPassword(),
              ),
              Expanded(
                flex: _loginBtnFlex,
                child: LoginPageLoginButton(),
              ),
              Expanded(
                flex: _dividerFlex,
                child: LoginPageOrDivider(),
              ),
              Expanded(
                flex: _authProvidersFlex,
                child: LoginPageAuthenticationProviders(),
              ),
              Expanded(
                flex: _registerFlex,
                child: LoginPageRegister(),
              ),
              Expanded(
                flex: _footerFlex,
                child: LoginPageFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
