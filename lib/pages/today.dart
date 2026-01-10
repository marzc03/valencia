import 'package:flutter/material.dart';


class TodayPage extends StatefulWidget {
  const TodayPage({super.key, required this.title});
  final String title;

  @override
  State<TodayPage> createState() => _TodayPageState();
}



class _TodayPageState extends State<TodayPage> {
  int currentPageIndex = 1;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"),
              fit: BoxFit.cover)
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.brown,
                ),
              ),
            )
          ),
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
      ),
    );
  }
}
