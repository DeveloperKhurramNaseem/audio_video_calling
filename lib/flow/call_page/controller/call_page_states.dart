import 'package:flutter/material.dart';

@immutable
abstract class CallPageState {}

@immutable
class CallPageInitialState extends CallPageState {}

@immutable
class CallPageLocalViewUpdateState extends CallPageState {}

@immutable
class CallPageRemoteViewUpdateState extends CallPageState {}
