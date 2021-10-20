import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    return // Probably need SafeArea()
        Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        // backgroundColor: Colors.white,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
