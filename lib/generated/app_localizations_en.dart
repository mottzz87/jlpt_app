// ignore_for_file: non_constant_identifier_names 

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'Welcome to JLPT Exam Platform';

  @override
  String get homeStartPractice => 'Start Practice';

  @override
  String get homeStartPracticeDescription => 'Begin your JLPT preparation with our practice exams.';

  @override
  String get homeLearnMore => 'Learn More';

  @override
  String get homeLearnMoreDescription => 'Discover more about our platform and JLPT exam preparation.';

  @override
  String get homeHeroTitle => 'Looking for an amazing website\nfor JLPT preparation?';

  @override
  String get homeHeroDescription => 'Massive real exam questions, smart grading system, detailed explanations\nMake your Japanese learning more efficient and exam preparation more confident!';

  @override
  String get homeShowcaseTitle => 'Selected Question Bank, Start Now,\nAre You Ready?';

  @override
  String get homeShowcaseDescription => 'Massive Question Bank · N1-N5 Coverage · Real-time Updates';

  @override
  String get examsTitle => 'Available Exams';

  @override
  String get examsDifficulty => 'Difficulty';

  @override
  String get examsDuration => 'Duration';

  @override
  String get examsQuestionCount => 'Question Count';

  @override
  String get examsStartExam => 'Start Exam';

  @override
  String get examsMinutes => 'minutes';

  @override
  String get examsUpdateTime => 'Updated';

  @override
  String get examsCreateTime => 'Created';

  @override
  String get examsDone => 'Done';

  @override
  String get examsTodo => 'Not Started';

  @override
  String get examsFree => 'Free';

  @override
  String get examsMember => 'Member';

  @override
  String get examsPracticeAvailable => 'Done';

  @override
  String get examsNoPractice => 'ToDo';

  @override
  String get examsExam => 'Exam';

  @override
  String get examsTotalQuestions => 'Total Questions';

  @override
  String get examsExamStartWarning => 'The timer will start immediately after beginning the exam. Please ensure you are in a quiet environment.';

  @override
  String get examsCancel => 'Cancel';

  @override
  String get examsQuestionNavigation => 'Question Navigation';

  @override
  String get examsYear => 'Year';

  @override
  String get examsExamTime => 'Exam Duration';

  @override
  String get examsHearingTime => 'Listening Duration';

  @override
  String get examsTotalScore => 'Total Score';

  @override
  String get examsYourScore => 'Your Score';

  @override
  String get examDetailQuestion => 'Question';

  @override
  String get examDetailPrevious => 'Previous';

  @override
  String get examDetailNext => 'Next';

  @override
  String get examDetailSubmit => 'Submit';

  @override
  String get examDetailConfirmSubmit => 'Confirm Submit';

  @override
  String get examDetailSubmitWarning => 'Are you sure you want to submit? You cannot modify your answers after submission.';

  @override
  String get examDetailContinue => 'Continue';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileEditProfile => 'Edit Profile';

  @override
  String get profileStudyProgress => 'Study Progress';

  @override
  String get profileExamHistory => 'Exam History';

  @override
  String get profileAchievements => 'Achievements';

  @override
  String get profileSettings => 'Settings';

  @override
  String get profileMembershipStatus => 'Membership Status';

  @override
  String get profileExpiryDate => 'Expiry Date';

  @override
  String get profileUpgrade => 'Upgrade';

  @override
  String get profileTotalExams => 'Total Exams';

  @override
  String get profileCompletedExams => 'Completed';

  @override
  String get profileAverageScore => 'Average Score';

  @override
  String get profileStudyStreak => 'Study Streak';

  @override
  String get profileDays => 'days';

  @override
  String get profileEmailNotSet => 'Email not set';

  @override
  String get profileFreeExams => 'Free Exams';

  @override
  String get profileLearnMore => 'Learn More';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsSound => 'Sound';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsPrivacy => 'Privacy Policy';

  @override
  String get settingsTerms => 'Terms of Service';

  @override
  String get settingsLogout => 'Logout';

  @override
  String get settingsConfirmLogout => 'Confirm Logout';

  @override
  String get settingsLogoutMessage => 'Are you sure you want to logout?';

  @override
  String get settingsCancel => 'Cancel';

  @override
  String get settingsConfirm => 'Confirm';

  @override
  String get settingsDarkMode => 'Dark Mode';

  @override
  String get settingsAutoPlay => 'Auto-play Audio';

  @override
  String get settingsVersion => 'Version';

  @override
  String get loginWelcomeBack => 'Welcome Back!';

  @override
  String get loginWeMissedYou => 'We missed you';

  @override
  String get loginEmailHint => 'Email Address';

  @override
  String get loginEmailRequired => 'Please enter your email';

  @override
  String get loginEmailInvalid => 'Please enter a valid email';

  @override
  String get loginPasswordHint => 'Password';

  @override
  String get loginPasswordTooShort => 'Password must be at least 6 characters';

  @override
  String get loginForgotPassword => 'Forgot Password?';

  @override
  String get loginButton => 'Login';

  @override
  String get loginNoAccount => 'Don\'t have an account? Sign up';

  @override
  String get loginContinueWith => 'Or continue with';

  @override
  String get registerCreateAccount => 'Create Account';

  @override
  String get registerStartJourney => 'Start your learning journey';

  @override
  String get registerEmailHint => 'Email Address';

  @override
  String get registerEmailRequired => 'Please enter your email';

  @override
  String get registerEmailInvalid => 'Please enter a valid email';

  @override
  String get registerPasswordHint => 'Password';

  @override
  String get registerPasswordTooShort => 'Password must be at least 6 characters';

  @override
  String get registerConfirmPasswordHint => 'Confirm Password';

  @override
  String get registerPasswordMismatch => 'Passwords do not match';

  @override
  String get registerButton => 'Sign Up';

  @override
  String get registerHaveAccount => 'Already have an account? Login';

  @override
  String registerFailure(String error) {
    return 'Registration failed: $error';
  }
}
