import 'package:flutter/material.dart';

import '../widget/radial_menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadialMenu(
          isOpen: isOpen,
          onTap: (){
            setState((){
              isOpen = !isOpen;
            });
          },
          children: [
            RadialButton(text: 'ရို့ရို့', onPress: () {}),
            RadialButton(text: 'ငြိမ်း', onPress: () {}),
            // RadialButton(text: 'Some Text', onPress: () {}),
            RadialButton(text: 'ညီမလေး', onPress: () {}),
            RadialButton(text: 'မမ', onPress: () {}),
            RadialButton(text: 'အကုန်ချစ်', onPress: () {}),
          ],
        ),
      ),
    );
  }
}
