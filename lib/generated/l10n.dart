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

  /// `Start`
  String get startOnboarding {
    return Intl.message(
      'Start',
      name: 'startOnboarding',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextOnboarding {
    return Intl.message(
      'Next',
      name: 'nextOnboarding',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Workout`
  String get workout {
    return Intl.message(
      'Workout',
      name: 'workout',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `What's your name?`
  String get whatsYourName {
    return Intl.message(
      'What`s your name?',
      name: 'whatsYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `What's your height?`
  String get whatsYourHeight {
    return Intl.message(
      'What`s your height?',
      name: 'whatsYourHeight',
      desc: '',
      args: [],
    );
  }

  /// `160 cm`
  String get cm160 {
    return Intl.message(
      '160 cm',
      name: 'cm160',
      desc: '',
      args: [],
    );
  }

  /// `What's your weight?`
  String get whatsYourWeight {
    return Intl.message(
      'What`s your weight?',
      name: 'whatsYourWeight',
      desc: '',
      args: [],
    );
  }

  /// `What's your goal?`
  String get whatsYourGoal {
    return Intl.message(
      'What`s your goal?',
      name: 'whatsYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `Steps`
  String get steps {
    return Intl.message(
      'Steps',
      name: 'steps',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get name {
    return Intl.message(
      'Name: ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a name`
  String get pleaseEnterAName {
    return Intl.message(
      'Please enter a name',
      name: 'pleaseEnterAName',
      desc: '',
      args: [],
    );
  }

  /// `Weight: `
  String get weight {
    return Intl.message(
      'Weight: ',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kg {
    return Intl.message(
      'kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a weight`
  String get pleaseEnterAWeight {
    return Intl.message(
      'Please enter a weight',
      name: 'pleaseEnterAWeight',
      desc: '',
      args: [],
    );
  }

  /// `Weight must be between 30 and 250`
  String get weightMustBeBetween30And250 {
    return Intl.message(
      'Weight must be between 30 and 250',
      name: 'weightMustBeBetween30And250',
      desc: '',
      args: [],
    );
  }

  /// `Height: `
  String get height {
    return Intl.message(
      'Height: ',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `cm`
  String get cm {
    return Intl.message(
      'cm',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a height`
  String get pleaseEnterAHeight {
    return Intl.message(
      'Please enter a height',
      name: 'pleaseEnterAHeight',
      desc: '',
      args: [],
    );
  }

  /// `Height must be between 100 and 250`
  String get heightMustBeBetween100And250 {
    return Intl.message(
      'Height must be between 100 and 250',
      name: 'heightMustBeBetween100And250',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Day 1 - Leg Day`
  String get day1LegDay {
    return Intl.message(
      'Day 1 - Leg Day',
      name: 'day1LegDay',
      desc: '',
      args: [],
    );
  }

  /// `Today steps`
  String get todaySteps {
    return Intl.message(
      'Today steps',
      name: 'todaySteps',
      desc: '',
      args: [],
    );
  }

  /// `Need access`
  String get needAccess {
    return Intl.message(
      'Need access',
      name: 'needAccess',
      desc: '',
      args: [],
    );
  }

  /// `Workout history`
  String get workoutHistory {
    return Intl.message(
      'Workout history',
      name: 'workoutHistory',
      desc: '',
      args: [],
    );
  }

  /// `Start Workout`
  String get startWorkout {
    return Intl.message(
      'Start Workout',
      name: 'startWorkout',
      desc: '',
      args: [],
    );
  }

  /// `day 1 - `
  String get day1 {
    return Intl.message(
      'day 1 - ',
      name: 'day1',
      desc: '',
      args: [],
    );
  }

  /// `Leg Day`
  String get legDay {
    return Intl.message(
      'Leg Day',
      name: 'legDay',
      desc: '',
      args: [],
    );
  }

  /// `Day Streak`
  String get dayStreak {
    return Intl.message(
      'Day Streak',
      name: 'dayStreak',
      desc: '',
      args: [],
    );
  }

  /// `Record - 32`
  String get record32 {
    return Intl.message(
      'Record - 32',
      name: 'record32',
      desc: '',
      args: [],
    );
  }

  /// `Week goal`
  String get weekGoal {
    return Intl.message(
      'Week goal',
      name: 'weekGoal',
      desc: '',
      args: [],
    );
  }

  /// `Max Streak - 4`
  String get maxStreak4 {
    return Intl.message(
      'Max Streak - 4',
      name: 'maxStreak4',
      desc: '',
      args: [],
    );
  }

  /// `day 1 - `
  String get day21 {
    return Intl.message(
      'day 1 - ',
      name: 'day21',
      desc: '',
      args: [],
    );
  }

  /// `No workouts available`
  String get noWorkoutsAvailable {
    return Intl.message(
      'No workouts available',
      name: 'noWorkoutsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Available Workouts`
  String get availableWorkouts {
    return Intl.message(
      'Available Workouts',
      name: 'availableWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Exercise count`
  String get exerciseCount {
    return Intl.message(
      'Exercise count',
      name: 'exerciseCount',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty`
  String get difficulty {
    return Intl.message(
      'Difficulty',
      name: 'difficulty',
      desc: '',
      args: [],
    );
  }

  /// `Create new workout`
  String get createNewWorkout {
    return Intl.message(
      'Create new workout',
      name: 'createNewWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Repetitions: `
  String get repetitions {
    return Intl.message(
      'Repetitions: ',
      name: 'repetitions',
      desc: '',
      args: [],
    );
  }

  /// `Sets: `
  String get sets {
    return Intl.message(
      'Sets: ',
      name: 'sets',
      desc: '',
      args: [],
    );
  }

  /// `Starting workout in: `
  String get startingWorkoutIn {
    return Intl.message(
      'Starting workout in: ',
      name: 'startingWorkoutIn',
      desc: '',
      args: [],
    );
  }

  /// `Next exercise in: `
  String get nextExerciseIn {
    return Intl.message(
      'Next exercise in: ',
      name: 'nextExerciseIn',
      desc: '',
      args: [],
    );
  }

  /// `Successfully finished`
  String get successfullyFinished {
    return Intl.message(
      'Successfully finished',
      name: 'successfullyFinished',
      desc: '',
      args: [],
    );
  }

  /// `*Please enter your weight\nafter workout`
  String get pleaseEnterYourWeightnafterWorkout {
    return Intl.message(
      '*Please enter your weight\nafter workout',
      name: 'pleaseEnterYourWeightnafterWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Your weight`
  String get yourWeight {
    return Intl.message(
      'Your weight',
      name: 'yourWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your weight`
  String get pleaseEnterYourWeight {
    return Intl.message(
      'Please enter your weight',
      name: 'pleaseEnterYourWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid integer`
  String get pleaseEnterAValidInteger {
    return Intl.message(
      'Please enter a valid integer',
      name: 'pleaseEnterAValidInteger',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a weight between 40 and 250`
  String get pleaseEnterAWeightBetween40And250 {
    return Intl.message(
      'Please enter a weight between 40 and 250',
      name: 'pleaseEnterAWeightBetween40And250',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Weight history`
  String get weightHistory {
    return Intl.message(
      'Weight history',
      name: 'weightHistory',
      desc: '',
      args: [],
    );
  }

  /// `Select workout`
  String get selectWorkout {
    return Intl.message(
      'Select workout',
      name: 'selectWorkout',
      desc: '',
      args: [],
    );
  }

  /// `You have not created workouts yet`
  String get youHaveNotCreatedWorkoutsYet {
    return Intl.message(
      'You have not created workouts yet',
      name: 'youHaveNotCreatedWorkoutsYet',
      desc: '',
      args: [],
    );
  }

  /// `Exercises: `
  String get exercisesWorkout {
    return Intl.message(
      'Exercises: ',
      name: 'exercisesWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Losing Weight Progress`
  String get losingWeightProgress {
    return Intl.message(
      'Losing Weight Progress',
      name: 'losingWeightProgress',
      desc: '',
      args: [],
    );
  }

  /// `Gaining Weight Progress`
  String get gainingWeightProgress {
    return Intl.message(
      'Gaining Weight Progress',
      name: 'gainingWeightProgress',
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
