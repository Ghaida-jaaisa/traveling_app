import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/trip_item.dart';
import '../app_data.dart';
import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;
  var _loadedInitData = false;

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgument =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final categoryId = routeArgument['id'];
      categoryTitle = routeArgument['title'] ?? '';

      displayTrips =
          widget.availableTrips.where((trip) {
            return trip.categories.contains(categoryId);
          }).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
