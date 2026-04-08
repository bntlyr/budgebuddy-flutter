import 'package:flutter/material.dart';

import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/nudge/presentation/screens/quick_nudge_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/teams/presentation/screens/teams_screen.dart';
import '../shared/widgets/app_bottom_nav.dart';
import '../shared/widgets/app_header.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  static const screens = [
    DashboardScreen(),
    TeamsScreen(),
    QuickNudgeScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: IndexedStack(index: index, children: screens),
      bottomNavigationBar: AppBottomNav(
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
      ),
    );
  }
}
