import 'package:d_reg/views/screens/history_screen.dart';
import 'package:d_reg/views/screens/rollcall_screen.dart';
import 'package:d_reg/views/screens/studentlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:d_reg/views/widgets/appbar_widget.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const StudentRollCallScreen(),
    const StudentListScreen(),
    const HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "D-REG"),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over, size: 36),
            label: 'RollCall',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 36),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 36),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  
}
