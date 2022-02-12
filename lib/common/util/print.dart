import 'dart:developer' as dev;

import 'package:nat_cv/common/util/build_mode.dart';

void log(dynamic logMessage, {String name = 'AIRBOX', dynamic error, dynamic stackTrace}) {
  if (BuildMode.isDebug) {
    dev.log(logMessage.toString(), name: name, error: error, stackTrace: stackTrace);
  }
}
