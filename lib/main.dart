import 'package:flutter/material.dart';
import 'package:lucky_number_2d/presentation/ta_kwat_kaung.dart';

import 'presentation/home.dart';

void main() => runApp(const Root());

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaKwatKaung(),
    );
  }
}

