import 'package:flutter/material.dart';

import '../resource/png_svg.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Points'),
                Container(
                  width: 55,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('100')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Points စုရန်')),
          ),
          RadialMenu(
            isOpen: isOpen,
            onTap: () {
              setState(() {
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 45,
              width: 111.67,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    viber,
                    height: 25,
                    width: 25,
                  ),
                  const Text('Viber'),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              width: 111.67,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    facebook,
                    height: 25,
                    width: 25,
                  ),
                  const Text('Facebook'),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              width: 111.67,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    rating,
                    height: 25,
                    width: 25,
                  ),
                  const Text('Rating'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
