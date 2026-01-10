import 'package:flutter/material.dart';

class CustRadio extends StatefulWidget {
  final List<String> options;
  final String title;
  final Function(String) onChanged;
  final String? initialValue;

  const CustRadio({
    super.key,
    required this.options,
    required this.title,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<CustRadio> createState() => _CustRadioState();
}

class _CustRadioState extends State<CustRadio> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(210, 222, 93, 0)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: <Widget>[
            Text(widget.title, style: TextStyle(fontSize: 16, color: const Color.fromARGB(210, 222, 93, 0),)),
            ...widget.options.map((option) => ListTile(
              title: Text(option, style: TextStyle(color: const Color.fromARGB(210, 222, 93, 0))),
              leading: Radio<String>(
                value: option,
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedValue = value;
                    });
                    widget.onChanged(value);
                  }
                },
               activeColor: Color.fromARGB(210, 222, 93, 0)
              ),
            )).toList(),
          ],
        )
      )
    );
  }
}