import 'package:audio_video_calling/flow/register_page/controller/register_page_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final registerPageStateNotifierProvider = StateNotifierProvider<RegisterPageStateNotifier,RegisterPageState>((ref) => RegisterPageStateNotifier());

class RegisterPageStateNotifier extends StateNotifier<RegisterPageState>{
  late TextEditingController userNameController , passwordController , emailController;
  RegisterPageStateNotifier():super(RegisterPageInitialState()){
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  register(){

  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}