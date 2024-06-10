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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hi! My name is IO.`
  String get hiMyNameIsIO {
    return Intl.message(
      'Hi! My name is IO.',
      name: 'hiMyNameIsIO',
      desc: '',
      args: [],
    );
  }

  /// `Hi!\n`
  String get Hi {
    return Intl.message(
      'Hi!\n',
      name: 'Hi',
      desc: '',
      args: [],
    );
  }

  /// `My name is `
  String get myNameIs {
    return Intl.message(
      'My name is ',
      name: 'myNameIs',
      desc: '',
      args: [],
    );
  }

  /// `IO.`
  String get io {
    return Intl.message(
      'IO.',
      name: 'io',
      desc: '',
      args: [],
    );
  }

  /// `I will help you \n`
  String get iWillHelpYou {
    return Intl.message(
      'I will help you \n',
      name: 'iWillHelpYou',
      desc: '',
      args: [],
    );
  }

  /// `with `
  String get withIO {
    return Intl.message(
      'with ',
      name: 'withIO',
      desc: '',
      args: [],
    );
  }

  /// `exercises!`
  String get exercises {
    return Intl.message(
      'exercises!',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `Answer `
  String get answer {
    return Intl.message(
      'Answer ',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `4 questions `
  String get Questions4 {
    return Intl.message(
      '4 questions ',
      name: 'Questions4',
      desc: '',
      args: [],
    );
  }

  /// `before we start our \n`
  String get beforeWeStartOur {
    return Intl.message(
      'before we start our \n',
      name: 'beforeWeStartOur',
      desc: '',
      args: [],
    );
  }

  /// `first training`
  String get firstTraining {
    return Intl.message(
      'first training',
      name: 'firstTraining',
      desc: '',
      args: [],
    );
  }

  /// `Mill`
  String get mill {
    return Intl.message(
      'Mill',
      name: 'mill',
      desc: '',
      args: [],
    );
  }

  /// `Exercise for leg muscles`
  String get millDescription {
    return Intl.message(
      'Exercise for leg muscles',
      name: 'millDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bicycle`
  String get bicycle {
    return Intl.message(
      'Bicycle',
      name: 'bicycle',
      desc: '',
      args: [],
    );
  }

  /// `Вправа для тренування м'язів ніг, серцево-судинної системи.`
  String get bicylceDescription {
    return Intl.message(
      'Вправа для тренування м\'язів ніг, серцево-судинної системи.',
      name: 'bicylceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Easy`
  String get easyDiff {
    return Intl.message(
      'Easy',
      name: 'easyDiff',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get mediumDiff {
    return Intl.message(
      'Medium',
      name: 'mediumDiff',
      desc: '',
      args: [],
    );
  }

  /// `Hard`
  String get hardDiff {
    return Intl.message(
      'Hard',
      name: 'hardDiff',
      desc: '',
      args: [],
    );
  }

  /// `Expert`
  String get expertDiff {
    return Intl.message(
      'Expert',
      name: 'expertDiff',
      desc: '',
      args: [],
    );
  }

  /// `Create workout`
  String get createWorkout {
    return Intl.message(
      'Create workout',
      name: 'createWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Nothing`
  String get nothing {
    return Intl.message(
      'Nothing',
      name: 'nothing',
      desc: '',
      args: [],
    );
  }

  /// `Workout title`
  String get workoutTitle {
    return Intl.message(
      'Workout title',
      name: 'workoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Workout difficulty`
  String get workoutDifficulty {
    return Intl.message(
      'Workout difficulty',
      name: 'workoutDifficulty',
      desc: '',
      args: [],
    );
  }

  /// `Select exercises`
  String get selectExercises {
    return Intl.message(
      'Select exercises',
      name: 'selectExercises',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
