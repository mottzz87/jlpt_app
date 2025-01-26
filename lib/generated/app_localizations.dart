// ignore_for_file: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('zh'),
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @homeTitle.
  ///
  /// In zh, this message translates to:
  /// **'欢迎来到 JLPT 考试平台'**
  String get homeTitle;

  /// No description provided for @homeStartPractice.
  ///
  /// In zh, this message translates to:
  /// **'开始练习'**
  String get homeStartPractice;

  /// No description provided for @homeStartPracticeDescription.
  ///
  /// In zh, this message translates to:
  /// **'通过我们的模拟考试开始您的 JLPT 备考之旅。'**
  String get homeStartPracticeDescription;

  /// No description provided for @homeLearnMore.
  ///
  /// In zh, this message translates to:
  /// **'了解更多'**
  String get homeLearnMore;

  /// No description provided for @homeLearnMoreDescription.
  ///
  /// In zh, this message translates to:
  /// **'详细了解我们的平台和 JLPT 考试准备。'**
  String get homeLearnMoreDescription;

  /// No description provided for @homeHeroTitle.
  ///
  /// In zh, this message translates to:
  /// **'寻找一个优秀的JLPT备考平台？'**
  String get homeHeroTitle;

  /// No description provided for @homeHeroDescription.
  ///
  /// In zh, this message translates to:
  /// **'海量真题练习，智能评分系统，详细解析讲解\n让您的日语学习更高效，考试更有把握！'**
  String get homeHeroDescription;

  /// No description provided for @homeShowcaseTitle.
  ///
  /// In zh, this message translates to:
  /// **'精选题库，即刻开始，\n你，准备好了吗？'**
  String get homeShowcaseTitle;

  /// No description provided for @homeShowcaseDescription.
  ///
  /// In zh, this message translates to:
  /// **'海量题库 · 覆盖N1-N5各个级别 · 实时更新'**
  String get homeShowcaseDescription;

  /// No description provided for @examsTitle.
  ///
  /// In zh, this message translates to:
  /// **'可用考试'**
  String get examsTitle;

  /// No description provided for @examsDifficulty.
  ///
  /// In zh, this message translates to:
  /// **'难度'**
  String get examsDifficulty;

  /// No description provided for @examsDuration.
  ///
  /// In zh, this message translates to:
  /// **'时长'**
  String get examsDuration;

  /// No description provided for @examsQuestionCount.
  ///
  /// In zh, this message translates to:
  /// **'题目数量'**
  String get examsQuestionCount;

  /// No description provided for @examsStartExam.
  ///
  /// In zh, this message translates to:
  /// **'开始考试'**
  String get examsStartExam;

  /// No description provided for @examsMinutes.
  ///
  /// In zh, this message translates to:
  /// **'分钟'**
  String get examsMinutes;

  /// No description provided for @examsUpdateTime.
  ///
  /// In zh, this message translates to:
  /// **'更新时间'**
  String get examsUpdateTime;

  /// No description provided for @examsCreateTime.
  ///
  /// In zh, this message translates to:
  /// **'创建时间'**
  String get examsCreateTime;

  /// No description provided for @examsDone.
  ///
  /// In zh, this message translates to:
  /// **'已做'**
  String get examsDone;

  /// No description provided for @examsTodo.
  ///
  /// In zh, this message translates to:
  /// **'未做'**
  String get examsTodo;

  /// No description provided for @examsFree.
  ///
  /// In zh, this message translates to:
  /// **'免费'**
  String get examsFree;

  /// No description provided for @examsMember.
  ///
  /// In zh, this message translates to:
  /// **'会员'**
  String get examsMember;

  /// No description provided for @examsPracticeAvailable.
  ///
  /// In zh, this message translates to:
  /// **'已做'**
  String get examsPracticeAvailable;

  /// No description provided for @examsNoPractice.
  ///
  /// In zh, this message translates to:
  /// **'未做'**
  String get examsNoPractice;

  /// No description provided for @examsExam.
  ///
  /// In zh, this message translates to:
  /// **'考试'**
  String get examsExam;

  /// No description provided for @examsTotalQuestions.
  ///
  /// In zh, this message translates to:
  /// **'题目数量'**
  String get examsTotalQuestions;

  /// No description provided for @examsExamStartWarning.
  ///
  /// In zh, this message translates to:
  /// **'开始考试后计时器将立即启动，请确保在安静的环境中进行考试'**
  String get examsExamStartWarning;

  /// No description provided for @examsCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get examsCancel;

  /// No description provided for @examsQuestionNavigation.
  ///
  /// In zh, this message translates to:
  /// **'题目导航'**
  String get examsQuestionNavigation;

  /// No description provided for @examsYear.
  ///
  /// In zh, this message translates to:
  /// **'年度'**
  String get examsYear;

  /// No description provided for @examsExamTime.
  ///
  /// In zh, this message translates to:
  /// **'考试时间'**
  String get examsExamTime;

  /// No description provided for @examsHearingTime.
  ///
  /// In zh, this message translates to:
  /// **'听力时间'**
  String get examsHearingTime;

  /// No description provided for @examsTotalScore.
  ///
  /// In zh, this message translates to:
  /// **'总分'**
  String get examsTotalScore;

  /// No description provided for @examsYourScore.
  ///
  /// In zh, this message translates to:
  /// **'你的得分'**
  String get examsYourScore;

  /// No description provided for @examDetailQuestion.
  ///
  /// In zh, this message translates to:
  /// **'题目'**
  String get examDetailQuestion;

  /// No description provided for @examDetailPrevious.
  ///
  /// In zh, this message translates to:
  /// **'上一题'**
  String get examDetailPrevious;

  /// No description provided for @examDetailNext.
  ///
  /// In zh, this message translates to:
  /// **'下一题'**
  String get examDetailNext;

  /// No description provided for @examDetailSubmit.
  ///
  /// In zh, this message translates to:
  /// **'提交试卷'**
  String get examDetailSubmit;

  /// No description provided for @examDetailConfirmSubmit.
  ///
  /// In zh, this message translates to:
  /// **'确认交卷'**
  String get examDetailConfirmSubmit;

  /// No description provided for @examDetailSubmitWarning.
  ///
  /// In zh, this message translates to:
  /// **'确定要交卷吗？提交后将无法修改答案。'**
  String get examDetailSubmitWarning;

  /// No description provided for @examDetailContinue.
  ///
  /// In zh, this message translates to:
  /// **'继续答题'**
  String get examDetailContinue;

  /// No description provided for @profileTitle.
  ///
  /// In zh, this message translates to:
  /// **'个人信息'**
  String get profileTitle;

  /// No description provided for @profileEditProfile.
  ///
  /// In zh, this message translates to:
  /// **'编辑资料'**
  String get profileEditProfile;

  /// No description provided for @profileStudyProgress.
  ///
  /// In zh, this message translates to:
  /// **'学习进度'**
  String get profileStudyProgress;

  /// No description provided for @profileExamHistory.
  ///
  /// In zh, this message translates to:
  /// **'考试历史'**
  String get profileExamHistory;

  /// No description provided for @profileAchievements.
  ///
  /// In zh, this message translates to:
  /// **'成就徽章'**
  String get profileAchievements;

  /// No description provided for @profileSettings.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get profileSettings;

  /// No description provided for @profileMembershipStatus.
  ///
  /// In zh, this message translates to:
  /// **'会员状态'**
  String get profileMembershipStatus;

  /// No description provided for @profileExpiryDate.
  ///
  /// In zh, this message translates to:
  /// **'到期时间'**
  String get profileExpiryDate;

  /// No description provided for @profileUpgrade.
  ///
  /// In zh, this message translates to:
  /// **'升级会员'**
  String get profileUpgrade;

  /// No description provided for @profileTotalExams.
  ///
  /// In zh, this message translates to:
  /// **'总考试数'**
  String get profileTotalExams;

  /// No description provided for @profileCompletedExams.
  ///
  /// In zh, this message translates to:
  /// **'已完成考试'**
  String get profileCompletedExams;

  /// No description provided for @profileAverageScore.
  ///
  /// In zh, this message translates to:
  /// **'平均分数'**
  String get profileAverageScore;

  /// No description provided for @profileStudyStreak.
  ///
  /// In zh, this message translates to:
  /// **'连续学习'**
  String get profileStudyStreak;

  /// No description provided for @profileDays.
  ///
  /// In zh, this message translates to:
  /// **'天'**
  String get profileDays;

  /// No description provided for @profileEmailNotSet.
  ///
  /// In zh, this message translates to:
  /// **'未设置邮箱'**
  String get profileEmailNotSet;

  /// No description provided for @profileFreeExams.
  ///
  /// In zh, this message translates to:
  /// **'免费考试'**
  String get profileFreeExams;

  /// No description provided for @profileLearnMore.
  ///
  /// In zh, this message translates to:
  /// **'学习更多'**
  String get profileLearnMore;

  /// No description provided for @settingsTitle.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get settingsLanguage;

  /// No description provided for @settingsNotifications.
  ///
  /// In zh, this message translates to:
  /// **'通知设置'**
  String get settingsNotifications;

  /// No description provided for @settingsTheme.
  ///
  /// In zh, this message translates to:
  /// **'主题设置'**
  String get settingsTheme;

  /// No description provided for @settingsSound.
  ///
  /// In zh, this message translates to:
  /// **'声音设置'**
  String get settingsSound;

  /// No description provided for @settingsAbout.
  ///
  /// In zh, this message translates to:
  /// **'关于我们'**
  String get settingsAbout;

  /// No description provided for @settingsPrivacy.
  ///
  /// In zh, this message translates to:
  /// **'隐私政策'**
  String get settingsPrivacy;

  /// No description provided for @settingsTerms.
  ///
  /// In zh, this message translates to:
  /// **'使用条款'**
  String get settingsTerms;

  /// No description provided for @settingsLogout.
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get settingsLogout;

  /// No description provided for @settingsConfirmLogout.
  ///
  /// In zh, this message translates to:
  /// **'确认退出'**
  String get settingsConfirmLogout;

  /// No description provided for @settingsLogoutMessage.
  ///
  /// In zh, this message translates to:
  /// **'确定要退出登录吗？'**
  String get settingsLogoutMessage;

  /// No description provided for @settingsCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get settingsCancel;

  /// No description provided for @settingsConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认'**
  String get settingsConfirm;

  /// No description provided for @settingsDarkMode.
  ///
  /// In zh, this message translates to:
  /// **'深色模式'**
  String get settingsDarkMode;

  /// No description provided for @settingsAutoPlay.
  ///
  /// In zh, this message translates to:
  /// **'自动播放音频'**
  String get settingsAutoPlay;

  /// No description provided for @settingsVersion.
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get settingsVersion;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
