import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../nutrition_algorithm.dart';
//Testing
import '../food_item.dart';

FoodItem cookie = FoodItem(
  name: 'cookie',
  calories: 51,
  protein: 2,
  fat: 3,
  carbs: 4,
);
int exerciseMinutes = 10;
List<int> calories = [cookie.getCalories()];
List<num> protein = [cookie.getProtein()];
List<num> fat = [cookie.getFat()];
List<num> carbs = [cookie.getCarbs()];

num sum(List<num> input) {
  //probably should be moved to home or validator thingt point
  num total = 0;
  for (int i = 0; i < input.length; i++) {
    total += input[i];
  }
  return total;
}

int sumCal(List<int> input) {
  int total = 0;
  for (int i = 0; i < input.length; i++) {
    total += input[i];
  }
  return total;
}

class TodayPage extends StatefulWidget {
  const TodayPage({super.key, required this.title});
  final String title;

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> with TickerProviderStateMixin {
  int currentPageIndex = 1;
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
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Wrap(
                children: [
                  Column(children: [
                  Text('Overall'),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: (sum(protein) * 4 / sumCal(calories) * 100),
                            title: 'Protein',
                            color: Colors.red,
                          ),
                          PieChartSectionData(
                            value: (sum(fat) * 9 / sumCal(calories) * 100),
                            title: 'Fat',
                            color: Colors.yellow,
                          ),
                          PieChartSectionData(
                            value: (sum(carbs) * 4 / sumCal(calories) * 100),
                            title: 'Carbs',
                            color: Colors.green,
                          ),
                        ],
                        centerSpaceRadius: 50,
                      ),
                      duration: Duration(milliseconds: 150), // Optional
                      curve: Curves.linear, // Optional
                    ),
                  ),
                  ]),
                  Column(children: [
                  Text('Protein'),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: (sum(protein) / NutritionAlgorithm.proteinNeeded(exerciseMinutes) * 100),
                            title: 'Protein',
                            color: Colors.red,
                          ),
                          PieChartSectionData(
                            value:
                                (1 - sum(protein) / NutritionAlgorithm.proteinNeeded(exerciseMinutes) * 100),
                            title: '',
                            color: Colors.grey,
                          ),
                        ],
                        centerSpaceRadius: 50,
                      ),
                      duration: Duration(milliseconds: 150), // Optional
                      curve: Curves.linear, // Optional
                    ),
                  ),
                  ]),
                  Column(children: [
                  Text('Fat'),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: (sum(fat) / NutritionAlgorithm.getFat(exerciseMinutes) * 100),
                            title: 'Fat',
                            color: Colors.yellow,
                          ),
                          PieChartSectionData(
                            value: (1 - sum(fat) / NutritionAlgorithm.getFat(exerciseMinutes) * 100),
                            title: '',
                            color: Colors.grey,
                          ),
                        ],
                        centerSpaceRadius: 50,
                      ),
                      duration: Duration(milliseconds: 150), // Optional
                      curve: Curves.linear, // Optional
                    ),
                  ),]),
                  Column(children: [
                  Text('Carbs'),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: (sum(carbs) / NutritionAlgorithm.getCarbs(exerciseMinutes) * 100),
                            title: 'Carbs',
                            color: Colors.green,
                          ),
                          PieChartSectionData(
                            value:
                                (1 - sum(carbs) /NutritionAlgorithm.getCarbs(exerciseMinutes) * 100),
                            title: '',
                            color: Colors.grey,
                          ),
                        ],
                        centerSpaceRadius: 50,
                      ),
                      duration: Duration(milliseconds: 150), // Optional
                      curve: Curves.linear, // Optional
                    ),
                  ),
                  ])
                ],
              ),
            ),
          ),
          Center(child: Column(children: [Text('Table')])),
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
                    ? '/today'
                    : value == 2
                    ? '/history'
                    : value == 3
                    ? '/profile'
                    : '/home',
              );
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today_rounded),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
