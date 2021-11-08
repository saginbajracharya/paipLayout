import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paiplayout/src/views/homeTabPages/following.dart';
import 'package:paiplayout/src/views/homeTabPages/judging.dart';
import 'package:paiplayout/src/views/homeTabPages/supporting.dart';
import 'package:paiplayout/src/views/homeTabPages/trending.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  TabController ? _tabController;
  int _selectedIndex = 0;
  
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset :false,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          toolbarOpacity: 0,
          backgroundColor: Colors.transparent,
          bottom: tabBars(),
        ),
        body: tabBarViewWidget()
      )
    );
  }

  TabBar tabBars() => TabBar(
    labelColor: Colors.white,    
    labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),  
    unselectedLabelColor: Colors.white70,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide.none,
      insets: EdgeInsets.all(0),
    ),
    indicatorWeight: 0,
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: EdgeInsets.all(0),  
    onTap: (index) {
      // _conJudging.page = 1;
      // _con.tabIndex=_selectedIndex;
    },
    controller: _tabController,
    tabs: [
      Tab(child: Text('juddging',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)),
      Tab(child: Text('trending',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)),
      Tab(child: Text('following',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)),
      Tab(child: Text('supporting',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)),
    ],
  );

  Widget tabBarViewWidget() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        //Judging
        Judging(selectedIndex: _selectedIndex),
        //Trending
        Trending(selectedIndex: _selectedIndex),
        //Following
        Following(selectedIndex:_selectedIndex),
        //Supporting
        Supporting(selectedIndex:_selectedIndex),
      ],
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}