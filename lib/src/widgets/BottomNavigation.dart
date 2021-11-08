import 'package:flutter/material.dart';
import 'package:paiplayout/src/views/bottomNavPages/add.dart';
import 'package:paiplayout/src/views/bottomNavPages/home.dart';
import 'package:paiplayout/src/views/bottomNavPages/message.dart';
import 'package:paiplayout/src/views/bottomNavPages/profile.dart';
import 'package:paiplayout/src/views/bottomNavPages/search.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key,this.index}) : super(key: key);
  final index;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> _children = [
    Home(),
    Search(),
    Add(),
    Message(),
    Profile(),
  ];
  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index['id'];
    }
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      // _con.page = 1;
      // _con.shownCardIndex=0;
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Color(0x00ffffff),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped, 
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}