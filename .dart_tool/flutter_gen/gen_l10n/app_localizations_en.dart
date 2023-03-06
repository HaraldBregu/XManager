import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get dashboard => 'Dashboard';

  @override
  String get player => 'player';

  @override
  String get create_player => 'create player';

  @override
  String get update_player => 'update player';

  @override
  String get fullname => 'fullname';

  @override
  String get enter_player_fullname => 'enter fullname';

  @override
  String get enter_player_fullname_error => 'please enter fullname';

  @override
  String get role => 'role';

  @override
  String get enter_player_role => 'enter player role';

  @override
  String get enter_player_role_error => 'please enter player role';

  @override
  String get nationality => 'nationality';

  @override
  String get enter_player_nationality => 'enter player nationality';

  @override
  String get birthdate_player => 'enter player birthdate';

  @override
  String get weight => 'weight';

  @override
  String get enter_weight => 'enter weight';

  @override
  String get height => 'height';

  @override
  String get enter_height => 'enter height';

  @override
  String get save => 'save';

  @override
  String get program_list_title => 'All programs';

  @override
  String get program_list_alert_title => 'Delete';

  @override
  String get program_list_alert_description => 'Are you sure you want to delete this session program?';

  @override
  String get program_list_alert_cancel => 'Cancel';

  @override
  String get program_list_alert_delete => 'Delete';

  @override
  String get create_program_title => 'Create program';

  @override
  String get save_program_title => 'Save program';

  @override
  String get create_program_description => 'You can create a new workout program by choosing a name, adding sessions and specifying the duration, then you can start using it.';

  @override
  String get create_program_field_name => 'Enter a name for this program';

  @override
  String get create_program_field_name_error => 'Please enter program name';

  @override
  String get save_program => 'Save program';
}
