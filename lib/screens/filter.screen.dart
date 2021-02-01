import 'package:flutter/material.dart';
import '../data/custom_color.dart';
import '../layout/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function setSettings;
  final Map<String, bool> _currentFilters;

  const FilterScreen(this._currentFilters, this.setSettings);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget._currentFilters['glutenFree'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegan = widget._currentFilters['vegan'];
    _lactoseFree = widget._currentFilters['lactoseFree'];

    super.initState();
  }

  void _submitSettings() {
    Map<String, bool> settings = {
      "glutenFree": _glutenFree,
      "vegetarian": _vegetarian,
      "vegan": _vegan,
      "lactoseFree": _lactoseFree,
    };
    widget.setSettings(settings);
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool currentValue,
    Function changeHandler,
  ) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(color: CustomColor.DARK_GREY),
        ),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: changeHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                "Adjust your meal selection.",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.DARK_GREY,
                  letterSpacing: .5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildSwitchTile(
                "Gluten-free", "Only include gluten-free meals.", _glutenFree,
                (value) {
              setState(() {
                _glutenFree = value;
                _submitSettings();
              });
            }),
            _buildSwitchTile("Lactose-free", "Only include lactose-free meals.",
                _lactoseFree, (value) {
              setState(() {
                _lactoseFree = value;
                _submitSettings();
              });
            }),
            _buildSwitchTile(
                "Vegetarian", "Only include vegetarian meals.", _vegetarian,
                (value) {
              setState(() {
                _vegetarian = value;
                _submitSettings();
              });
            }),
            _buildSwitchTile("Vegan", "Only include vegan meals.", _vegan,
                (value) {
              setState(() {
                _vegan = value;
                _submitSettings();
              });
            }),
          ],
        ),
      ),
    );
  }
}
