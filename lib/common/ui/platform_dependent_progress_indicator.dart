import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nat_cv/common/util/platform.dart';

class PlatformDependentProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoActivityIndicator() : CircularProgressIndicator();
  }
}
