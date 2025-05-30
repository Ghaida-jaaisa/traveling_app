import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});
static const screenRoute = '/filters' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: Text('الفلترة'),),
  drawer: AppDrawer(),
    );
  }
}
