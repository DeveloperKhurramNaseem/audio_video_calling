import 'dart:developer';

import 'package:audio_video_calling/flow/login_page/controller/login_page_states.dart';
import 'package:audio_video_calling/services/user_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageStateNotifierProvider =
    StateNotifierProvider<LoginPageStateNotifier, LoginPageState>(
        (ref) => LoginPageStateNotifier());

class LoginPageStateNotifier extends StateNotifier<LoginPageState> {
  // Constants
  static const _filePath = 'lib/flow/login_page/controller/login_page_state_notifier.dart';
  // Controllers
  late TextEditingController emailController, passwordController;
  // Instances
  final UserAuthService _authService = UserAuthService();
  // Constructor
  LoginPageStateNotifier() : super(LoginPageInitialState()) {
    // Initializing Controllers
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void loginWithEmailAndPassword() async {
    try{
      _authService.signInUser(emailController.text, passwordController.text);
    }catch(e){
      log('[Error : ${e.toString()}]\n$_filePath');
    }
  }

  void signInWithGoogle() async {
    try{
      _authService.signInWithGoogle();
    }catch(e){
      log('[Error : ${e.toString()}]\n$_filePath');
    }
  }

  Future<bool> loginWithFacebook() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> loginWithTwitter() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
