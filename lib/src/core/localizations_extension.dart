import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
