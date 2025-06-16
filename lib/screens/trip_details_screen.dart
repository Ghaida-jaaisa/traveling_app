import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip-details';

  // const TripDetailsScreen({super.key});
  final Function manageFavorite;
  final Function isFavorite;

  TripDetailsScreen(this.manageFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(titleText, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(10),
      height: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    // select right trip
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedTrip.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedTrip.imageUrl),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder:
                    (ctx, index) => Card(
                      elevation: 0.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedTrip.activities[index]),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 10),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder:
                    (context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              ' يوم ${index + 1}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          title: Text(selectedTrip.program[index]),
                        ),
                        Divider(),
                      ],
                    ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(tripId) ? Icons.delete : Icons.star),
        onPressed:() => manageFavorite(tripId),
      ),
    );
  }
}
