import 'package:flutter/material.dart';
import 'package:scrapuncle_flutter/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrapUncle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',

        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green[600], // Makes theme.colorScheme.primary = green
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 244, 229),

        textTheme: TextTheme(
          headlineSmall: TextStyle(
            color: Colors.green[600],
            fontWeight: FontWeight.bold,
          ),

          titleMedium: TextStyle(color: Colors.green[600]),
          bodyMedium: TextStyle(color: Colors.grey[700]),
        ),

        iconTheme: IconThemeData(
          color: Colors.green[600], // or Colors.green
        ),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.green,
          selectionColor: Colors.green.shade100,
          selectionHandleColor: Colors.green,
        ),

        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey[700]),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
      home: DashboardScreen(),
    );
  }
}
