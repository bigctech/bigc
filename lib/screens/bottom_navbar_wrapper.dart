import 'package:bigc/routes/app_routes.dart';
import 'package:bigc/screens/approve/approve_page.dart';
import 'package:bigc/screens/home/home_page.dart';
import 'package:bigc/screens/profile/profile_page.dart';
import 'package:bigc/screens/tasks/tasks_page.dart';
import 'package:flutter/material.dart';

class BottomNavbarWrapper extends StatefulWidget {
  const BottomNavbarWrapper({super.key});

  @override
  State<BottomNavbarWrapper> createState() => _BottomNavbarWrapperState();
}

class _BottomNavbarWrapperState extends State<BottomNavbarWrapper> {
  int _selectedPage = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  final _pages = [
    AppRoutes.home,
    AppRoutes.profile,
    AppRoutes.approve,
    AppRoutes.tasks
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedPage = index;
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        _pages[index],
        (route) => false, // Removes all the previous routes from the stack
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: AppRoutes.home,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                getCurrentPage(routeSetting.name!),
            transitionDuration: const Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.white,
          currentIndex: _selectedPage,
          onTap: _changeTab,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.checklist), label: "Approve"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }

  /// Returning page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.home:
        return const HomePage();
      case AppRoutes.tasks:
        return const TasksPage();
      case AppRoutes.approve:
        return const ApprovePage();
      case AppRoutes.profile:
        return const ProfilePage();
      default:
        return const HomePage(); // Default to home if route is unknown
    }
  }
}
