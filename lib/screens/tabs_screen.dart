import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({super.key});
  final List<Trip> favoriteTrips;

  TabsScreen(this.favoriteTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  late List<Map<String, dynamic>> _screen;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screen = [
      {'Screen': CategoriesScreen(), 'Title': 'تصنيفات الرحلات'},
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screen[_selectedScreenIndex]['Title'])),
      drawer: AppDrawer(),
      body: _screen[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
        ],
      ),
    );
  }
}
