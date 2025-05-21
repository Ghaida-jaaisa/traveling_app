import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
// Variables
  final String id;
  final String title;
  final String imageUrl;

// Constructor
  CategoryItem(this.id, this.title, this.imageUrl);

  // Methods
  void selectCategory(BuildContext context){
Navigator.of(context).pushNamed(
    CategoryTripsScreen.screenRoute ,
  arguments: {
      'title' : title,
       'id' : id
  }
); }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
      selectCategory(context);
      },
     splashColor: Theme.of(context).primaryColor,
      child: Stack(
      children: [
       ClipRRect(
         borderRadius: BorderRadius.circular(15),
         child: Image.network(imageUrl ,
          height: 250.0,
          fit: BoxFit.cover,),
       ),
        Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Text(
          title,
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
          // fontWeight: FontWeight.bold
      ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(0, 0, 0, 0.4),
      ),
        )
      
      ],
      ),
    );
  }
}
