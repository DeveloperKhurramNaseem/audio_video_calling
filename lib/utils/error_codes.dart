
/// https://www.zegocloud.com/docs/video-call/error-code?platform=flutter&language=dart
/// Check Error Code Details from this link for remaining error codes
class ErrorCodes{
  static const successful = 0;
  static const engineNotCreated = 1000001;
  // Cause : Engine Not Created
  // Solution : Call createEngine()
  static const roomNotLoggedIn = 1000002;
  // Cause : Not logged into Room
  // Solution : Call loginRoom()
  static const audioVideoWithoutEngineStarted = 1000003;
  // Cause : Audio & Video Modules with no engine started
  // Solution : call startPreviewView() , startPublishingStream() , startPlayingStream()  
  static const repeatedEventHandlers = 1000008;
  // Cause setEventHandler() called repeatedly
  // Solution : To call again clear previous one
  static const featureNotSupported = 1000010;
  // The SDK current version doesn't include this feature
}
