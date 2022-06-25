import 'package:flutter/material.dart';
import 'package:gsb_day03/pages/tabs/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final tabs = [
  Center(child: Text('Home')),
  SettingScreen()

];

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.inventory),
        title: Text('Home'),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped ,
      ),
    );
  }

  _onItemTapped(int index){
    _currentIndex = index;
    setState((){});
  }
}
