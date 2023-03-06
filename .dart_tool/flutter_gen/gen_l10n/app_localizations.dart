import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @player.
  ///
  /// In en, this message translates to:
  /// **'player'**
  String get player;

  /// No description provided for @create_player.
  ///
  /// In en, this message translates to:
  /// **'create player'**
  String get create_player;

  /// No description provided for @update_player.
  ///
  /// In en, this message translates to:
  /// **'update player'**
  String get update_player;

  /// No description provided for @fullname.
  ///
  /// In en, this message translates to:
  /// **'fullname'**
  String get fullname;

  /// No description provided for @enter_player_fullname.
  ///
  /// In en, this message translates to:
  /// **'enter fullname'**
  String get enter_player_fullname;

  /// No description provided for @enter_player_fullname_error.
  ///
  /// In en, this message translates to:
  /// **'please enter fullname'**
  String get enter_player_fullname_error;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'role'**
  String get role;

  /// No description provided for @enter_player_role.
  ///
  /// In en, this message translates to:
  /// **'enter player role'**
  String get enter_player_role;

  /// No description provided for @enter_player_role_error.
  ///
  /// In en, this message translates to:
  /// **'please enter player role'**
  String get enter_player_role_error;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'nationality'**
  String get nationality;

  /// No description provided for @enter_player_nationality.
  ///
  /// In en, this message translates to:
  /// **'enter player nationality'**
  String get enter_player_nationality;

  /// No description provided for @birthdate_player.
  ///
  /// In en, this message translates to:
  /// **'enter player birthdate'**
  String get birthdate_player;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'weight'**
  String get weight;

  /// No description provided for @enter_weight.
  ///
  /// In en, this message translates to:
  /// **'enter weight'**
  String get enter_weight;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'height'**
  String get height;

  /// No description provided for @enter_height.
  ///
  /// In en, this message translates to:
  /// **'enter height'**
  String get enter_height;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @program_list_title.
  ///
  /// In en, this message translates to:
  /// **'All programs'**
  String get program_list_title;

  /// No description provided for @program_list_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get program_list_alert_title;

  /// No description provided for @program_list_alert_description.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this session program?'**
  String get program_list_alert_description;

  /// No description provided for @program_list_alert_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get program_list_alert_cancel;

  /// No description provided for @program_list_alert_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get program_list_alert_delete;

  /// No description provided for @create_program_title.
  ///
  /// In en, this message translates to:
  /// **'Create program'**
  String get create_program_title;

  /// No description provided for @save_program_title.
  ///
  /// In en, this message translates to:
  /// **'Save program'**
  String get save_program_title;

  /// No description provided for @create_program_description.
  ///
  /// In en, this message translates to:
  /// **'You can create a new workout program by choosing a name, adding sessions and specifying the duration, then you can start using it.'**
  String get create_program_description;

  /// No description provided for @create_program_field_name.
  ///
  /// In en, this message translates to:
  /// **'Enter a name for this program'**
  String get create_program_field_name;

  /// No description provided for @create_program_field_name_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter program name'**
  String get create_program_field_name_error;

  /// No description provided for @save_program.
  ///
  /// In en, this message translates to:
  /// **'Save program'**
  String get save_program;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
