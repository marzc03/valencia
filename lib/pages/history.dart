import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../nutrition_algorithm.dart';

//Need to adjust columns once data is called from firebase

//Testing
import '../food_item.dart';
import '../user.dart';

User testUser = User(
  age: 17,
  w: 110,
  h: 67,
  activityLevel: ActivityLevel.moderatelyActive,
  sex: Sex.female,
  mode: Mode.recomposition,
  units: Units.imperial,
);

NutritionAlgorithm alg = NutritionAlgorithm(testUser);

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

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key, required this.title});
  final String title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
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
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 400,
                  child: BarChart(
                    BarChartData(
                      barGroups: [
                        BarChartGroupData(
                          x: 7,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),
                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),

                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),

                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),

                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),

                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),

                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: alg
                                  .caloriesNeeded(exerciseMinutes)
                                  .toDouble(),

                              rodStackItems: [
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100) +
                                      (sum(carbs) *
                                          4 /
                                          sumCal(calories) *
                                          100)),
                                  Colors.green,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  ((sum(protein) * 4 / sumCal(calories) * 100) +
                                      (sum(fat) * 9 / sumCal(calories) * 100)),
                                  Colors.yellow,
                                ),
                                BarChartRodStackItem(
                                  0,
                                  (sum(protein) * 4 / sumCal(calories) * 100),
                                  Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    duration: Duration(milliseconds: 150), // Optional
                    curve: Curves.linear, // Optional
                  ),
                ),
              ],
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
