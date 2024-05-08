import 'dart:developer';

import 'package:audio_video_calling/services/video_call_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  String streamId = 'Khurram1234';
  Widget? localView , remoteView;
  int? localViewId, remoteViewId;
  final VideoCallService _service = VideoCallService(); 

  @override
  void initState() {
    super.initState();
    
    requestPermissions();    
  }

  requestPermissions() async{
    await Permission.camera.request();
    await Permission.audio.request();
    await Permission.microphone.request();
    init();
  }

  init()async{
    await _service.initialize();
    _service.setUpEventHandlers(onPublisherStateUpdate: (streamID, state, errorCode, extendedData) {
      
    },onRoomStateUpdate: (roomID, state, errorCode, extendedData) {
      
    },onRoomStreamUpdate: (roomID, updateType, streamList, extendedData) {
      if(updateType == ZegoUpdateType.Add){
        for(var stream in streamList){
          startPlayStream(stream.streamID);
        }
      }else{
        for (final stream in streamList) {
        stopPlayStream(stream.streamID);
      }
      }
    },onRoomUserUpdate: (roomID, updateType, userList) {
      
    },);
    await _service.loginRoom(roomId: 'MyRoom',userId: '456',userName: 'Ameer');        
    log('Done');
    localView = await _service.startLocalVideoPreview();
    setState(() {
      
    });
    await _service.startPublishingLocalStream(streamId: streamId);
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Expanded(flex: 1,child: localView ?? const ColoredBox(color: Colors.blue),),
            Expanded(flex: 1,child: remoteView ?? const ColoredBox(color: Colors.red),),
          ],
        
        ),
      ),),      
    );
  }

  Future<void> startPlayStream(String streamID) async {
  // Start to play streams. Set the view for rendering the remote streams.
  await ZegoExpressEngine.instance.createCanvasView((viewID) {
    remoteViewId = viewID;
    ZegoCanvas canvas = ZegoCanvas(viewID, viewMode: ZegoViewMode.AspectFill);
    ZegoExpressEngine.instance.startPlayingStream(streamID, canvas: canvas);
  }).then((canvasViewWidget) {
    setState(() => remoteView = canvasViewWidget);
  });
}

Future<void> stopPlayStream(String streamID) async {
  ZegoExpressEngine.instance.stopPlayingStream(streamID);
  if (remoteView != null) {
    ZegoExpressEngine.instance.destroyCanvasView(remoteViewId!);
    setState(() {
      remoteViewId = null;
      remoteView = null;
    });
  }
}
}