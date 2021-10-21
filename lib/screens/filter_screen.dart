import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return // Probably need SafeArea()
        Scaffold(
            appBar: AppBar(
              title: const Text('Your Filters'),
              // backgroundColor: Colors.white,
            ),
            drawer: MainDrawer(),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Adjust your meal selection.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildSwitchListTile(
                          _glutenFree, 'Gluten-free', 'Only gluten-free meals.',
                          (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }),
                      _buildSwitchListTile(_lactoseFree, 'Lactose-free',
                          'Only lactose-free meals.', (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }),
                      _buildSwitchListTile(
                          _vegetarian, 'Vegetarian', 'Only Vegetarian meals.',
                          (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }),
                      _buildSwitchListTile(_vegan, 'Vegan', 'Only vegan meals.',
                          (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }),
                    ],
                  ),
                )
              ],
            ));
  }

  SwitchListTile _buildSwitchListTile(
      bool flag, String title, String subtitle, ValueChanged<bool> handler) {
    return SwitchListTile(
      value: flag,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: handler,
    );
  }
}
