import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryTitle ?? '',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(child: Text('قائمة برحلات هذا التصنيف')),
    );
  }

}
