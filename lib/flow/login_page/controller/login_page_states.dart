import 'package:flutter/material.dart';

@immutable
abstract class LoginPageState{}

@immutable
class LoginPageInitialState extends LoginPageState{}


@immutable
class LoginPageLoadingState extends LoginPageState{}

@immutable
class LoginPageDoneState extends LoginPageState{}

@immutable
class LoginPageErrorState extends LoginPageState{}