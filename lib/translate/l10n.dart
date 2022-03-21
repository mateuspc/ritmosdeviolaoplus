// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class LocalizationsApp {
  LocalizationsApp();

  static LocalizationsApp? _current;

  static LocalizationsApp get current {
    assert(_current != null,
        'No instance of LocalizationsApp was loaded. Try to initialize the LocalizationsApp delegate before accessing LocalizationsApp.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<LocalizationsApp> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = LocalizationsApp();
      LocalizationsApp._current = instance;

      return instance;
    });
  }

  static LocalizationsApp of(BuildContext context) {
    final instance = LocalizationsApp.maybeOf(context);
    assert(instance != null,
        'No instance of LocalizationsApp present in the widget tree. Did you add LocalizationsApp.delegate in localizationsDelegates?');
    return instance!;
  }

  static LocalizationsApp? maybeOf(BuildContext context) {
    return Localizations.of<LocalizationsApp>(context, LocalizationsApp);
  }

  /// `Ritmos de violão`
  String get app_name {
    return Intl.message(
      'Ritmos de violão',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Share with friend`
  String get share_with_friend {
    return Intl.message(
      'Share with friend',
      name: 'share_with_friend',
      desc: '',
      args: [],
    );
  }

  /// `Team contact`
  String get team_contact {
    return Intl.message(
      'Team contact',
      name: 'team_contact',
      desc: '',
      args: [],
    );
  }

  /// `Other Apps`
  String get other_apps {
    return Intl.message(
      'Other Apps',
      name: 'other_apps',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get terms_of_use {
    return Intl.message(
      'Terms of use',
      name: 'terms_of_use',
      desc: '',
      args: [],
    );
  }

  /// `Lifetime`
  String get lifetime {
    return Intl.message(
      'Lifetime',
      name: 'lifetime',
      desc: '',
      args: [],
    );
  }

  /// `BUY`
  String get buy {
    return Intl.message(
      'BUY',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Restore purchases`
  String get restore_purchases {
    return Intl.message(
      'Restore purchases',
      name: 'restore_purchases',
      desc: '',
      args: [],
    );
  }

  /// `Purchase successfully restored`
  String get restore_successfully {
    return Intl.message(
      'Purchase successfully restored',
      name: 'restore_successfully',
      desc: '',
      args: [],
    );
  }

  /// `No purchase not found`
  String get no_purchase_not_found {
    return Intl.message(
      'No purchase not found',
      name: 'no_purchase_not_found',
      desc: '',
      args: [],
    );
  }

  /// `In the lifetime plan, you pay only once and have access to all the features of the app!`
  String get lifetime_plan_description {
    return Intl.message(
      'In the lifetime plan, you pay only once and have access to all the features of the app!',
      name: 'lifetime_plan_description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<LocalizationsApp> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LocalizationsApp> load(Locale locale) => LocalizationsApp.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
