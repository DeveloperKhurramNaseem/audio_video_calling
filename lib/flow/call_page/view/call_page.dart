
import 'package:audio_video_calling/flow/call_page/controller/call_page_notifier.dart';
import 'package:audio_video_calling/flow/call_page/controller/call_page_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallPage extends ConsumerStatefulWidget {
  const CallPage({super.key});

  @override
  ConsumerState<CallPage> createState() => _CallPageState();
}

class _CallPageState extends ConsumerState<CallPage> {
  @override
  void initState() {
    super.initState();    
    // ref.read(callPageStateNotifierProvider.notifier).initializeEngine();
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: const Column(
            children: [
              Expanded(
                flex: 1,
                child: LocalView(),
              ),
              Expanded(
                flex: 1,
                child: RemoteView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LocalView extends ConsumerWidget {
  const LocalView({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(callPageStateNotifierProvider);
    var notifier = ref.read(callPageStateNotifierProvider.notifier);
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),),child: Builder(builder: (context) {
      if(state is CallPageLocalViewUpdateState){
      return notifier.localView ?? const ColoredBox(color: Colors.blue);
    } else{
      return const ColoredBox(color: Colors.blue);
    }
    },),);
  }
}

class RemoteView extends ConsumerWidget {
  const RemoteView({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(callPageStateNotifierProvider);
    var notifier = ref.read(callPageStateNotifierProvider.notifier);
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),),child: Builder(builder: (context) {
      if(state is CallPageRemoteViewUpdateState){
      return notifier.remoteView ?? const ColoredBox(color: Colors.red);
    } else{
      return const ColoredBox(color: Colors.red);
    }
    },),);
  }
}