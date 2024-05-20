import 'dart:developer';
import 'package:audio_video_calling/flow/call_page/controller/call_page_states.dart';
import 'package:audio_video_calling/utils/error_handling/error_codes_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_express_engine/zego_express_engine.dart';


// Call Page State Notifier provider
final callPageStateNotifierProvider =
    StateNotifierProvider<CallPageStateNotifier, CallPageState>(
        (ref) => CallPageStateNotifier());


// Call Page State Notifier => aka ui controller :)
class CallPageStateNotifier extends StateNotifier<CallPageState>
    with ErrorCodesHandler {
  static const appId = 503559034;
  static const appSign =
      'da03108bf3f9d732b4bf5dd97a0cedeb7bf2ad9432d284f243aa6dbfe549415c';
  String streamId = 'Khurram1234';
  Widget? localView, remoteView;
  int? localViewId, remoteViewId;
  CallPageStateNotifier() : super(CallPageInitialState());

  // Initialize the whole engine
  initializeEngine() async {
    // To request necessary permissions
    bool isPermissionGranted = await _requestPermissions();
    if (isPermissionGranted) {
      // Initializing service      
      await _initialize();
      // Setting Event Handlers
      _setUpEventHandlers();
      // Logging in to a new room
      await _loginRoom(roomId: 'MyRoom', userId: '456', userName: 'Khurram');      
      // Starting local video preview
      localView = await _startLocalVideoPreview();      
      state = CallPageLocalViewUpdateState();
      // Started Publishing local stream
      await _startPublishingLocalStream(streamId: streamId);
    }
  }

  // Initializing the ZegoExpressEngine
  Future<void> _initialize() async {
    await ZegoExpressEngine.createEngineWithProfile(
      ZegoEngineProfile(
        appId,
        ZegoScenario.Default,
        appSign: appSign,
      ),
    );
  }

  // Starting Local Video Preview
  Future<Widget?> _startLocalVideoPreview() async {
    var videoWidget = await ZegoExpressEngine.instance.createCanvasView(
      (viewID) {
        localViewId = viewID;
        ZegoCanvas canvas =
            ZegoCanvas(viewID, viewMode: ZegoViewMode.AspectFill);
        ZegoExpressEngine.instance.startPreview(canvas: canvas);
      },
    );
    return videoWidget;
  }

  // Stopping Local Video Preview
  Future<void> _stopLocalVideoPreview() async {
    await ZegoExpressEngine.instance.stopPreview();
  }

  // Destroying local view Canvas
  Future<bool> _destroyLocalCanvas(int? localViewId) async {
    assert(localViewId != null);
    if (localViewId != null) {
      final isDestroyed =
          await ZegoExpressEngine.instance.destroyCanvasView(localViewId);
      localViewId = null;
      return isDestroyed;
    }
    return false;
  }

  // Start publishing local stream
  Future<void> _startPublishingLocalStream({required String streamId}) async {
    await ZegoExpressEngine.instance.startPublishingStream(streamId);
  }

  // Setting up Event handler
  _setUpEventHandlers() {
    ZegoExpressEngine.onRoomStreamUpdate = _onRoomStreamUpdate;
    ZegoExpressEngine.onRoomStateUpdate = _onRoomStateUpdate;
    ZegoExpressEngine.onRoomUserUpdate = _onRoomUserUpdate;
    ZegoExpressEngine.onPublisherStateUpdate = _onPublisherStateUpdate;    
  }

  // Clearing Up Event Handlers
  void _clearingEventHandlers() {
    ZegoExpressEngine.onRoomStreamUpdate = null;
    ZegoExpressEngine.onRoomStateUpdate = null;
    ZegoExpressEngine.onRoomUserUpdate = null;
    ZegoExpressEngine.onPublisherStateUpdate = null;
  }

  // Requesting Appropriate Permissions
  Future<bool> _requestPermissions() async {
    final cameraPermissionStatus = await Permission.camera.request();    
    final microphonePermissionStatus = await Permission.microphone.request();
    log('[Camera Permission : $cameraPermissionStatus]');    
    log('[Microphone Permission Status : $microphonePermissionStatus]');
    return cameraPermissionStatus == PermissionStatus.granted&&        
        microphonePermissionStatus == PermissionStatus.granted;
  }

  // Start to play remote stream
  Future<void> _startPlayStream(String streamID) async {
    // Start to play streams. Set the view for rendering the remote streams.
    await ZegoExpressEngine.instance.createCanvasView((viewID) {
      remoteViewId = viewID;
      ZegoCanvas canvas = ZegoCanvas(viewID, viewMode: ZegoViewMode.AspectFill);
      ZegoExpressEngine.instance.startPlayingStream(streamID, canvas: canvas);
    }).then((canvasViewWidget) {
      remoteView = canvasViewWidget;
      state = CallPageRemoteViewUpdateState();
    });
  }

  // Stop to play stream
  Future<void> _stopPlayStream(String streamID) async {
    ZegoExpressEngine.instance.stopPlayingStream(streamID);
    if (remoteView != null) {
      await ZegoExpressEngine.instance.destroyCanvasView(remoteViewId!);
      remoteView = null;
      remoteViewId = null;
    }
  }

  // On Room stream Update Callback => Whenever a new stream is added in stream list
  void _onRoomStreamUpdate(String roomID, ZegoUpdateType updateType,
      List<ZegoStream> streamList, Map<String, dynamic> extendedData) {
    if (updateType == ZegoUpdateType.Add) {
      for (var stream in streamList) {
        _startPlayStream(stream.streamID);
      }
    } else {
      for (final stream in streamList) {
        _stopPlayStream(stream.streamID);
      }
    }
  }

  // On Room User Update callback => Whenever a new user has joined the stream
  void _onRoomUserUpdate(
      String roomID, ZegoUpdateType updateType, List<ZegoUser> userList) {}

  // On Room state Update Callback => Whenever Room state changes like connecting , connected , disconnected
  void _onRoomStateUpdate(String roomID, ZegoRoomState state, int errorCode,
      Map<String, dynamic> extendedData) {}

  // On Publisher state update callback => Whenever publisher state changes like publishing , not publishing
  void _onPublisherStateUpdate(String streamID, ZegoPublisherState state,
      int errorCode, Map<String, dynamic> extendedData) {}

  // Login to a specific Room
  Future<bool> _loginRoom(
      {String userId = '', String userName = '', String roomId = ''}) async {
    var user = ZegoUser(userId, userName);
    var config = ZegoRoomConfig.defaultConfig();
    config.isUserStatusNotify = true;
    ZegoRoomLoginResult result = await ZegoExpressEngine.instance
        .loginRoom(roomId, user, config: config);
    return checkSuccess(result.errorCode);
  }

  // Logout From a specific room
  Future<bool> _logoutFromRoom({String roomId = ''}) async {
    var result = await ZegoExpressEngine.instance.logoutRoom(roomId);
    return checkSuccess(result.errorCode);
  }

  Future<bool> _stopPublishingLocalStream() async {
    await ZegoExpressEngine.instance.stopPublishingStream();
    return _destroyLocalCanvas(localViewId);
  }

  Future<bool> _destroyRemoteCanvas() async {
    assert(remoteViewId != null);
    if (remoteViewId != null) {
      final isDestroyed =
          await ZegoExpressEngine.instance.destroyCanvasView(remoteViewId!);
      remoteViewId = null;
      return isDestroyed;
    }
    return false;
  }
}
