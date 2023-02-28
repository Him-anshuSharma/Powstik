import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [    'Healthy Snacks',    'Millets',    'Super Foods',    'Plant Proteins',    'Beverages',    'Medical Nutrition',    'Organic Staples',    'Services',    'All'  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((String tab) {
            return Tab(
              text: tab,
            );
          }).toList(),
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((String tab) {
          return Center(
            child: Text(tab),
          );
        }).toList(),
      ),
    );
  }
}
