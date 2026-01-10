import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.title});
  final String title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}



class _HistoryPageState extends State<HistoryPage> with TickerProviderStateMixin {
  int currentPageIndex = 2;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Graph'),
            Tab(text: 'Table'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(child: 
            Column(children: [
              Text('Graph')
            ],)
          ),
          Center(child: 
            Column(children: [
              Text('Table')
            ],)),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
              Navigator.pushNamed(
                context,
                    value == 0
                    ? '/home'
                    : value == 1
                      ?'/today'
                      : value == 2
                        ? '/history'
                        : value == 3
                          ? '/profile'
                          :'/home'
              );
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon (Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.today_rounded), label: 'Today'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile')
          ]
        )
      )
    );
  }
}
