import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  static const screenRoute = '/filters';

  FiltersScreen(this.saveFilters, this.currentFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  SwitchListTile buildSwitchListTile(
      String title,
      String subTitle,
      bool currentValue,
      void Function(bool) updateValue,
      ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    super.initState();
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الفلترة'), actions: [
        IconButton(
          onPressed: () {
            final selectedFilters = {
              'summer': _summer,
              'winter': _winter,
              'family': _family,
            };
            widget.saveFilters(selectedFilters);
          },
          icon: Icon(Icons.save),
        )
      ]),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 50),
                buildSwitchListTile(
                  'الرحلات الصيفية',
                  'اظهار الرحلات الصيفية فقط',
                  _summer,
                      (newValue) {
                    setState(() {
                      _summer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية',
                  'اظهار الرحلات الشتوية فقط',
                  _winter,
                      (newValue) {
                    setState(() {
                      _winter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات العائلية',
                  'اظهار الرحلات العائلية فقط',
                  _family,
                      (newValue) {
                    setState(() {
                      _family = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
