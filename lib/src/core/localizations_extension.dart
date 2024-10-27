import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xmanager/src/core/common.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
