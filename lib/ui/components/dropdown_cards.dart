import 'package:flutter/material.dart';

class DropdownCards extends StatefulWidget {
  const DropdownCards({super.key});

  @override
  _DropdownCardsState createState() => _DropdownCardsState();
}

class _DropdownCardsState extends State<DropdownCards> {
  String _selectedItem = 'visa ***1234';
  final List<String> _items = ['visa ***1234', 'мир ***4214', 'visa ***9432'];  

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Color(0xFF0500FF).withValues(alpha: 0.3),
      value: _selectedItem,
      icon: Icon(Icons.arrow_drop_down),
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue!;
        });
      },
      items: _items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return _items.map<Widget>((String item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(item),
            ],
          );
        }).toList();
      },
    );
  }
}
