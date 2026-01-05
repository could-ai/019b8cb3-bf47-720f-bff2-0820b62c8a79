import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/tutorial_list_screen.dart';
import 'screens/part_picker_screen.dart';

void main() {
  runApp(const PCRakitApp());
}

class PCRakitApp extends StatelessWidget {
  const PCRakitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC Rakit Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E5FF), // Cyberpunk Blue
          brightness: Brightness.dark,
          surface: const Color(0xFF121212),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF1E1E1E),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/tutorials': (context) => const TutorialListScreen(),
        '/part-picker': (context) => const PartPickerScreen(),
      },
    );
  }
}
