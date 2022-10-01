import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suhu/widget/column_suhu_kelvin.dart';
import 'package:suhu/widget/column_suhu_reamor.dart';
import 'package:suhu/widget/input_suhu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputSuhuController = TextEditingController();

  // Dynamic variable
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  String _stringKelvin = '0.0';
  String _stringReamur = '0.0';

  void _temperatureConversion() {
    setState(() {
      _inputUser = double.parse(inputSuhuController.text);
      _kelvin = _inputUser + 273;
      _reamur = _inputUser * (4 / 5);

      _stringKelvin = _kelvin.toStringAsFixed(1);
      _stringReamur = _reamur.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konversi Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input_Suhu(inputSuhuController: inputSuhuController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column_Suhu_Kelvin(stringKelvin: _stringKelvin),
                  Column_Suhu_Reamor(stringReamur: _stringReamur),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: ElevatedButton(
                  onPressed: _temperatureConversion,
                  child: Text(
                    'Konversi Suhu',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
