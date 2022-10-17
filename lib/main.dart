import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:suhu/widget/column_suhu_kelvin.dart';
// import 'package:suhu/widget/column_suhu_reamor.dart';
import 'package:suhu/widget/input_suhu.dart';
import 'package:suhu/widget/convert_suhu.dart';
import 'package:suhu/widget/histori_suhu.dart';
import 'package:suhu/widget/hasil_suhu.dart';

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
  // double _inputUser = 0;
  // double _kelvin = 0;
  // double _reamur = 0;

  double _inputUser = 0;
  double _hasil = 0;

  // String _stringKelvin = '0.0';
  // String _stringReamur = '0.0';
  String _value = 'Kelvin';
  var listItem = ['Kelvin', 'Reamur'];

  List<String> listViewItem = <String>[];

  void _temperatureConversion() {
    setState(() {
      _inputUser = double.parse(inputSuhuController.text);
      // _kelvin = _inputUser + 273;
      // _reamur = _inputUser * (4 / 5);

      // _stringKelvin = _kelvin.toStringAsFixed(1);
      // _stringReamur = _reamur.toStringAsFixed(1);
      if (_value == 'Kelvin') {
        _hasil = _inputUser + 273;
        listViewItem.add('Kelvin:$_hasil');
      } else {
        _hasil = (4 / 5) * _inputUser;
        listViewItem.add('Reamur:$_hasil');
      }
    });
  }

  void dropdownOnChanged(String? changeValue) {
    setState(() {
      _value = changeValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 256,
                child: DropdownButton<String>(
                  isExpanded: true,
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 247, 0, 0)),
                      ),
                    );
                  }).toList(),
                  value: _value,
                  onChanged: dropdownOnChanged,
                ),
              ),
              Hasil_Suhu(hasil: _hasil),
              Convert_Suhu(
                convertHandler: _temperatureConversion,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Histori_Suhu(listViewItem: listViewItem),
              Expanded(
                child: ListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
