import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
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
        Locale('ar' , 'AE'), // English
      ],
      theme: ThemeData(
        primaryColor: Colors.blue,
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
         fontFamily: 'ElMessiri',
        useMaterial3: true,
      ),
      title: 'Travel App',
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(), //default
           CategoryTripsScreen.screenRoute : (ctx) => CategoryTripsScreen()

      },
    );
  }
}