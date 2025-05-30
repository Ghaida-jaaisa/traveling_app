import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/category_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        children: Categories_data.map(
                (categoryData) {
              return CategoryItem(
                  categoryData.id,
                  categoryData.title,
                  categoryData.imageUrl);
            }
        ).toList(),
      );
  }
  }