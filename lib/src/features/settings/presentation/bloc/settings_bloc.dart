import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/settings/presentation/bloc/settings_event.dart';
import 'package:xmanager/src/features/settings/presentation/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {

  }
}
