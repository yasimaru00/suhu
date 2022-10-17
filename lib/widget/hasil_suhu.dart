import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hasil_Suhu extends StatelessWidget {
  const Hasil_Suhu({Key? key, required this.hasil}) : super(key: key);

  final double hasil;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            hasil.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 54,
            ),
          ),
        ],
      ),
    );
  }
}
