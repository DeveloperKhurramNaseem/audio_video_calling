import 'package:audio_video_calling/call_page/controller/call_page_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final callPageStateNotifierProvider =
    StateNotifierProvider<CallPageStateNotifier, CallPageState>(
        (ref) => CallPageStateNotifier());

class CallPageStateNotifier extends StateNotifier<CallPageState> {
  CallPageStateNotifier() : super(CallPageInitialState());
}
