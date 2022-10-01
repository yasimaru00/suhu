import 'package:flutter/material.dart';

class Column_Suhu_Kelvin extends StatelessWidget {
  const Column_Suhu_Kelvin({
    Key? key,
    required String stringKelvin,
  })  : _stringKelvin = stringKelvin,
        super(key: key);

  final String _stringKelvin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            'Suhu dalam Kelvin',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Text(
          '$_stringKelvin',
          style: TextStyle(fontSize: 48),
        ),
      ],
    );
  }
}
