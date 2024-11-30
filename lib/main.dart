import 'package:flutter/material.dart';
import 'home_page.dart';
import 'notes_screen.dart';
import 'splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        // Customizing the color scheme to use Blue and White
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // White background
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,    // Blue accents
          secondary: Colors.white, // White secondary color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,   // Blue button
            foregroundColor: Colors.white,  // White text on the button
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded button
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Blue app bar
          titleTextStyle: TextStyle(
            color: Colors.white,        // White title text
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.blue[50], // Light blue for note cards
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners on cards
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.blue, fontSize: 16), // Correct text style
        ),
      ),
      initialRoute: "/",
      routes: {
        "/" : (_) => SplashScreen(),
        "/notes" : (_) => NotesPage(),
        "/home" : (_) => HomePageScreen(),
      },
      debugShowCheckedModeBanner: false, // Removed the debug banner
    );
  }
}




