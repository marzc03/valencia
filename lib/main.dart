import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
import 'pages/today.dart';
import 'pages/history.dart';
import 'pages/profile.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await SharedPreferencesService().init();
  runApp(Valencia());
}

class Valencia extends StatelessWidget {
  const Valencia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valencia: Nutrition Tracker',
      theme: ThemeData(
       textTheme: TextTheme(
        titleLarge: GoogleFonts.dynaPuff(),
        titleMedium: GoogleFonts.dynaPuff(),
        titleSmall: GoogleFonts.dynaPuff(),
        headlineLarge: GoogleFonts.dynaPuff(),
        headlineMedium: GoogleFonts.dynaPuff(),
        headlineSmall: GoogleFonts.dynaPuff(),
        bodyLarge: GoogleFonts.mynerve(),
        bodyMedium: GoogleFonts.mynerve(),
        bodySmall: GoogleFonts.mynerve(),
        labelLarge: GoogleFonts.dynaPuff(),
        labelMedium: GoogleFonts.dynaPuff(),
        labelSmall: GoogleFonts.dynaPuff(),
       ),
       
       bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:  GoogleFonts.dynaPuff(textStyle: const TextStyle(color: Color.fromARGB(255,54, 106, 60))),
        unselectedLabelStyle: GoogleFonts.dynaPuff(textStyle: const TextStyle(color: Color.fromARGB(255, 113, 116, 109))),
        elevation: 0.0
       ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 255, 102)),
      ),
      home: const HomePage(title: 'Nutrition'),
      routes: {
        '/home': (context) => const HomePage(title: 'Home'),
        '/today': (context) => const TodayPage (title: 'Today'),
        '/history': (context) => const HistoryPage (title: 'History'),
        '/profile': (context) => const ProfilePage (title: 'Profile'),
      },
    );
  }
}

