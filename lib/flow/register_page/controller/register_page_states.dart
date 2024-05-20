import 'package:flutter/material.dart';

@immutable
abstract class RegisterPageState{}

@immutable
class RegisterPageInitialState extends RegisterPageState{}

@immutable
class RegisterPageLoadingState extends RegisterPageState{}

@immutable
class RegisterPageDoneState extends RegisterPageState{}

@immutable
class RegisterPageErrorState extends RegisterPageState{}