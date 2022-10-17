import 'package:flutter/material.dart';

class Column_Suhu_Reamor extends StatelessWidget {
  const Column_Suhu_Reamor({
    Key? key,
    required String stringReamur,
  })  : _stringReamur = stringReamur,
        super(key: key);

  final String _stringReamur;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            'Suhu dalam Reamor',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Text(
          '$_stringReamur',
          style: TextStyle(fontSize: 48),
        ),
      ],
    );
  }
}
