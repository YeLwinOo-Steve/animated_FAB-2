import 'package:flutter/material.dart';

import '../resource/resource.dart';

class TaKwatKaung extends StatelessWidget {
  const TaKwatKaung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Text(
                  '38',
                  style: TextStyle(
                    fontSize: 67,
                    color: ColorManager.white,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 65),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: FontSize.body2),
                children: [
                  TextSpan(
                    text: 'တစ်ကွက်ကောင်း',
                    style: TextStyle(color: ColorManager.primary),
                  ),
                  TextSpan(
                    text:
                        'သည် မှန်ရန်အလွန်နည်းသည့်အတွက် ကံစမ်းယုံသာ ကစားရန်အကြံပြုပါသည်။',
                    style: TextStyle(color: ColorManager.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
