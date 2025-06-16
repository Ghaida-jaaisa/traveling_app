import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_details_screen.dart';
import '/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './models/trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
List<Trip> _availableTrips = Trips_data;


  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      // Map = Map
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if(_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if(_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if(_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(),
        FiltersScreen.screenRoute: (ctx) => FiltersScreen(_changeFilters, _filters),
      },
    );
  }
}
