import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
// Variables
  final String title;
  final String imageUrl;


  CategoryItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
