import 'package:flutter/material.dart';

import '../features/onboarding/presentation/screens/account_setup_step1_screen.dart';
import '../features/onboarding/presentation/screens/account_setup_step2_screen.dart';
import '../features/onboarding/presentation/screens/login_screen.dart';
import '../features/onboarding/presentation/screens/payment_screen.dart';
import '../features/onboarding/presentation/screens/pricing_screen.dart';
import '../features/onboarding/presentation/screens/result_screen.dart';
import '../features/onboarding/presentation/screens/signup_screen.dart';
import '../features/onboarding/presentation/screens/splash_screen.dart';
import '../features/onboarding/presentation/screens/verification_screen.dart';
import '../features/onboarding/presentation/screens/welcome_screen.dart';
import '../features/settings/presentation/screens/edit_profile_screen.dart';
import '../features/settings/presentation/screens/notifications_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/teams/presentation/screens/add_team_screen.dart';
import '../features/teams/presentation/screens/team_channel_screen.dart';
import 'home_shell.dart';

class AppRouter {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String verification = '/verification';
  static const String accountSetupStep1 = '/account-setup-step-1';
  static const String accountSetupStep2 = '/account-setup-step-2';
  static const String pricing = '/pricing';
  static const String payment = '/payment';
  static const String result = '/result';
  static const String home = '/home';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String addTeam = '/add-team';
  static const String teamChannel = '/team-channel';
  static const String editProfile = '/edit-profile';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _page(const SplashScreen());
      case welcome:
        return _page(const WelcomeScreen());
      case login:
        return _page(const LoginScreen());
      case signUp:
        return _page(const SignUpScreen());
      case verification:
        return _page(const VerificationScreen());
      case accountSetupStep1:
        return _page(const AccountSetupStep1Screen());
      case accountSetupStep2:
        return _page(const AccountSetupStep2Screen());
      case pricing:
        return _page(const PricingScreen());
      case payment:
        final args = (routeSettings.arguments as Map<String, dynamic>?) ?? {};
        return _page(PaymentScreen(isFree: args['isFree'] == true));
      case result:
        final args = (routeSettings.arguments as Map<String, dynamic>?) ?? {};
        return _page(ResultScreen(success: args['success'] == true));
      case home:
        return _page(const HomeShell());
      case notifications:
        return _page(const NotificationsScreen());
      case settings:
        return _page(const SettingsScreen());
      case addTeam:
        return _page(const AddTeamScreen());
      case teamChannel:
        final args = (routeSettings.arguments as Map<String, dynamic>?) ?? {};
        return _page(
          TeamChannelScreen(teamName: args['teamName']?.toString() ?? 'Team'),
        );
      case editProfile:
        return _page(const EditProfileScreen());
      default:
        return _page(const SplashScreen());
    }
  }

  static MaterialPageRoute<dynamic> _page(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
