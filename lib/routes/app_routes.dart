import 'package:bigc/screens/approve/approve_page.dart';
import 'package:bigc/screens/home/home_page.dart';
import 'package:bigc/screens/profile/profile_page.dart';
import 'package:bigc/screens/tasks/tasks_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home_page';

  static const String tasks = '/tasks_page';

  static const String approve = '/approve_page';

  static const String profile = '/profile_page';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        // initialRoute: (context) => OnBoardingScreen(),
        home: (context) => const HomePage(),
        profile: (context) => const ProfilePage(),
        tasks: (context) => const TasksPage(),
        approve: (context) => const ApprovePage()
      };
}
