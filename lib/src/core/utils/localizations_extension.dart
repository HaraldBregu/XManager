import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xmanager/src/core/utils/common.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
