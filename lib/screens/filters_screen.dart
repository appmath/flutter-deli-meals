import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/util/constants.dart';
import 'package:flutter_deli_meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  final Function saveFilterHandler; // a.k.a. saveFilters
  final Map<String, bool> currentFilters;

  FiltersScreen(
      {required this.currentFilters, required this.saveFilterHandler});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters[gluten] ?? false;
    _vegetarian = widget.currentFilters[vegetarian] ?? false;
    _vegan = widget.currentFilters[vegan] ?? false;
    _lactoseFree = widget.currentFilters[lactose] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return // Probably need SafeArea()
        Scaffold(
            appBar: AppBar(
              title: const Text('Your Filters'),
              actions: [
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    final selectedFilters = {
                      gluten: _glutenFree,
                      lactose: _lactoseFree,
                      vegan: _vegan,
                      vegetarian: _vegetarian,
                    };

                    widget.saveFilterHandler(selectedFilters);
                  },
                )
              ],
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
