import 'package:audio_video_calling/flow/login_page/controller/login_page_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageStateNotifierProvider = StateNotifierProvider<LoginPageStateNotifier,LoginPageState>((ref) => LoginPageStateNotifier());

class LoginPageStateNotifier extends StateNotifier<LoginPageState>{
  late TextEditingController emailController , passwordController;
  LoginPageStateNotifier():super(LoginPageInitialState()){
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  Future<bool> loginWithEmailAndPassword() async{
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> loginWithGoogle() async{
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> loginWithFacebook() async{
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> loginWithTwitter() async{
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