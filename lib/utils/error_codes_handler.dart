import 'dart:developer';

import 'package:audio_video_calling/utils/error_codes.dart';

mixin ErrorCodesHandler{
  bool checkSuccess(int code){
    if(code == ErrorCodes.successful){
      return true;
    }else if(code == ErrorCodes.engineNotCreated){
      log('[Error : Engine Is Not Created. Create Engine First.]');
    }else if(code == ErrorCodes.roomNotLoggedIn){
      log('[Error : Room is not logged In. Log in to room first]');
    }else if(code == ErrorCodes.repeatedEventHandlers){
      log('[Error : Event Handler is set more than once]');
    }else if(code == ErrorCodes.audioVideoWithoutEngineStarted){
      log('[Error : Audio & Video Module is accessed with no Engine Started]');
    }else if(code == ErrorCodes.featureNotSupported){
      log('[Error : This feature is not currently supported by SDK]');
    }else{
      log('[Error : Some Unknown Error => Error Code : $code]');
    }
    return false;
  }
}