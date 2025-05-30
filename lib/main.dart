import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_details_screen.dart';
import '/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
      ],
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'ElMessiri',
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          // أو Brightness.dark
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.amber,
          onSecondary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
      ),

      // ),
      title: 'Travel App',
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(), //default
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(),
        FiltersScreen.screenRoute: (ctx) => FiltersScreen(),
      },
    );
  }
}
