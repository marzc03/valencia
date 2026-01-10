//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'themes/theme_provider.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/today.dart';
import 'pages/history.dart';
import 'pages/profile.dart';


Future <void> main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await SharedPreferencesService().init();
  runApp(Valencia());
  */
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const Valencia(),
  ));
}

class Valencia extends StatelessWidget {
  const Valencia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valencia: Nutrition Tracker',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home:  LoginPage(
        onTap: () {},
      ),
      routes: {
        '/home': (context) => const HomePage(title: 'Home'),
        '/today': (context) => const TodayPage (title: 'Today'),
        '/history': (context) => const HistoryPage (title: 'History'),
        '/profile': (context) => const ProfilePage (title: 'Profile'),
      },
    );
  }
}

