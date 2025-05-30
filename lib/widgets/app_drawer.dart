import 'package:flutter/material.dart';
import 'package:traveling_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});


  ListTile buildListTile(String title, IconData icon,VoidCallback onTapLink){
    return ListTile(
      onTap: onTapLink,
      leading: Icon(icon , size: 30, color: Colors.blue,),
      title: Text(title, style: TextStyle(fontFamily: 'ElMessiri' , fontSize: 24, fontWeight: FontWeight.bold),),
    );
  }
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.bold
    );


    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40.0),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('دليللك السياحي' , style: _textStyle,),
          ),
          SizedBox(height: 20,) ,
          buildListTile('الرحلات', Icons.card_travel, () {Navigator.of(context).pushReplacementNamed('/');} ),
          buildListTile('الفلترة', Icons.filter_list, () {Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);} )



        ],
      ),
    );
  }
}
