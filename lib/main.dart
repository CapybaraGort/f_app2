import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/screens/main_screen.dart';
import 'package:flutter_application_2/user_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => UserState(),
        child: MainApp(),
      )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = GoogleFonts.madaTextTheme(ThemeData.light().textTheme).copyWith(
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    );
    return MaterialApp(
      theme: ThemeData(
        textTheme: textTheme
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}