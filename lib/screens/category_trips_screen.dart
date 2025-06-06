import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/trip_item.dart';
// import 'package:traveling_app/app_data.dart';
import '../app_data.dart';
class CategoryTripsScreen extends StatelessWidget {

  // Variables
  static const screenRoute = '/category-trips';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! Map<String, String>) {
      return Scaffold(
        appBar: AppBar(title: Text('خطأ')),
        body: Center(child: Text('لا توجد بيانات تم تمريرها')),
      );
    }
    final categoryId = args['id'];
    final categoryTitle = args['title'];
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryTitle ?? '',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
          itemBuilder: (context , index) {
          return TripItem(
            id: filteredTrips[index].id,
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            tripType: filteredTrips[index].tripType,
            season: filteredTrips[index].season,
          );
          },
        itemCount: filteredTrips.length,
      )
    );
  }

}
