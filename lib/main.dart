import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
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
  List<Trip> _favouriteTips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      // Map = Map
      _filters = filterData;
      _availableTrips =
          Trips_data.where((trip) {
            if (_filters['summer'] == true && trip.isInSummer != true) {
              return false;
            }
            if (_filters['winter'] == true && trip.isInWinter != true) {
              return false;
            }
            if (_filters['family'] == true && trip.isForFamilies != true) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex = _favouriteTips.indexWhere(
      (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favouriteTips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteTips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }
  bool _isFavorite(String tripId) {
    return _favouriteTips.any((trip) => trip.id == tripId);
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
        '/': (ctx) => TabsScreen(_favouriteTips), //default
        CategoryTripsScreen.screenRoute:
            (ctx) => CategoryTripsScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(_manageFavorite, _isFavorite),
        FiltersScreen.screenRoute:
            (ctx) => FiltersScreen(_changeFilters, _filters),
      },
    );
  }
}
