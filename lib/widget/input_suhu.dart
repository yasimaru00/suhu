import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input_Suhu extends StatelessWidget {
  const Input_Suhu({
    Key? key,
    required this.inputSuhuController,
  }) : super(key: key);

  final TextEditingController inputSuhuController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputSuhuController,
      decoration: InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
