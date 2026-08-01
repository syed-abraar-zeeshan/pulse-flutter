import 'package:flutter/material.dart';
import 'package:pulse_flutter/core/constants/app_strings.dart';
import 'package:pulse_flutter/features/chat/presentation/screens/chats_screen.dart';
import 'package:pulse_flutter/features/friends/presentation/screens/friends_screen.dart';
import 'package:pulse_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:pulse_flutter/features/navigation/presentation/screens/navigation_tab.dart';
import 'package:pulse_flutter/features/profile/presentation/screens/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  NavigationTab _selectedTab = NavigationTab.home;

  final List<Widget> _screens = const [
    HomeScreen(),
    FriendsScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedTab.index, children: _screens),
      bottomNavigationBar: SafeArea(
        top: false,
        child: NavigationBar(
          selectedIndex: _selectedTab.index,
          onDestinationSelected: (index) {
            setState(() {
              _selectedTab = NavigationTab.values[index];
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: AppStrings.home,
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline),
              selectedIcon: Icon(Icons.people),
              label: AppStrings.friends,
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat),
              label: AppStrings.chats,
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: AppStrings.profile,
            ),
          ],
        ),
      ),
    );
  }
}
