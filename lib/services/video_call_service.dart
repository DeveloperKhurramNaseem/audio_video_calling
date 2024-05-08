import 'package:audio_video_calling/utils/error_codes_handler.dart';
import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class VideoCallService with ErrorCodesHandler {
  static const appId = 503559034;
  static const appSign = 'da03108bf3f9d732b4bf5dd97a0cedeb7bf2ad9432d284f243aa6dbfe549415c';
  int? localViewId, remoteViewId;

  // Singleton Implementation
  static VideoCallService? _instance;
  VideoCallService._internal();
  factory VideoCallService() {
    return _instance ??= VideoCallService._internal();
  }
  // Initializing the ZegoExpressEngine
  Future<void> initialize() async {
    await ZegoExpressEngine.createEngineWithProfile(
      ZegoEngineProfile(
        appId,
        ZegoScenario.Default,
        appSign: appSign,
      ),
    );
  }

  // Setting Up Event Handlers
  void setUpEventHandlers(
      {void Function(String roomID, ZegoUpdateType updateType,
              List<ZegoStream> streamList, Map<String, dynamic> extendedData)?
          onRoomStreamUpdate,
      void Function(String roomID, ZegoRoomState state, int errorCode,
              Map<String, dynamic> extendedData)?
          onRoomStateUpdate,
      void Function(String roomID, ZegoUpdateType updateType,
              List<ZegoUser> userList)?
          onRoomUserUpdate,
      void Function(String streamID, ZegoPublisherState state, int errorCode,
              Map<String, dynamic> extendedData)?
          onPublisherStateUpdate}) {
    ZegoExpressEngine.onRoomStreamUpdate = onRoomStreamUpdate;
    ZegoExpressEngine.onRoomStateUpdate = onRoomStateUpdate;
    ZegoExpressEngine.onRoomUserUpdate = onRoomUserUpdate;
    ZegoExpressEngine.onPublisherStateUpdate = onPublisherStateUpdate;
  }

  // Clearing Up Event Handlers
  void clearingEventHandlers() {
    ZegoExpressEngine.onRoomStreamUpdate = null;
    ZegoExpressEngine.onRoomStateUpdate = null;
    ZegoExpressEngine.onRoomUserUpdate = null;
    ZegoExpressEngine.onPublisherStateUpdate = null;
  }

  // Login to a specific Room
  Future<bool> loginRoom(
      {String userId = '', String userName = '', String roomId = ''}) async {
    var user = ZegoUser(userId, userName);
    var config = ZegoRoomConfig.defaultConfig();
    config.isUserStatusNotify = true;
    ZegoRoomLoginResult result = await ZegoExpressEngine.instance
        .loginRoom(roomId, user, config: config);
    return checkSuccess(result.errorCode);
  }

  // Logout From a specific room
  Future<bool> logoutFromRoom({String roomId = ''}) async {
    var result = await ZegoExpressEngine.instance.logoutRoom(roomId);
    return checkSuccess(result.errorCode);
  }

  // Starting Local Video Preview
  Future<Widget?> startLocalVideoPreview() async {
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
  Future<void> stopLocalVideoPreview() async {
    await ZegoExpressEngine.instance.stopPreview();
  }

  // Destroying local view Canvas
  Future<bool> _destroyLocalCanvas() async {
    assert(localViewId != null);
    if (localViewId != null) {
      final isDestroyed =
          await ZegoExpressEngine.instance.destroyCanvasView(localViewId!);
      localViewId = null;
      return isDestroyed;
    }
    return false;
  }

  Future<void> startPublishingLocalStream({required String streamId}) async {
    await ZegoExpressEngine.instance.startPublishingStream(streamId);
  }

  Future<bool> stopPublishingLocalStream() async {
    await ZegoExpressEngine.instance.stopPublishingStream();
    return _destroyLocalCanvas();
  }

  Future<Widget?> startPlayingIncomingStream({required String streamId}) async {
    var videoViewWidget =
        await ZegoExpressEngine.instance.createCanvasView((viewID) {
      remoteViewId = viewID;
      ZegoCanvas canvas = ZegoCanvas(viewID, viewMode: ZegoViewMode.AspectFill);
      ZegoExpressEngine.instance.startPlayingStream(streamId, canvas: canvas);
    });
    return videoViewWidget;
  }

  Future<bool> stopPlayingIncomingStream({required String streamId}) async {
    await ZegoExpressEngine.instance.stopPlayingStream(streamId);
    return _destroyRemoteCanvas();
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
