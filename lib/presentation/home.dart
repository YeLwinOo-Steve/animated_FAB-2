import 'package:flutter/material.dart';

import '../widget/radial_menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadialMenu(
          children: [
            RadialButton(icon: const Icon(Icons.numbers), onPress: () {}),
            RadialButton(icon: const Icon(Icons.numbers), onPress: () {}),
            RadialButton(icon: const Icon(Icons.numbers), onPress: () {}),
            RadialButton(icon: const Icon(Icons.numbers), onPress: () {}),
            RadialButton(icon: const Icon(Icons.numbers), onPress: () {}),
            RadialButton(icon: const Icon(Icons.numbers), onPress: () {}),
          ],
        ),
      ),
    );
  }
}
