import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/controller.dart';
import '../resource/resource.dart';
import '../resource/route_manager.dart';
import '../widget/radial_menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Future<void> _launchViber() async {
  await launchUrl(
    Uri.parse('viber://pa?chatURI=+959972090952'),
    mode: LaunchMode.externalNonBrowserApplication,
  );
}

class _HomeState extends State<Home> {
  final controller = Get.find<LotteryController>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close, color: ColorManager.primary),
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, AppRoutes.about2D),
                leading: const Text(
                  '2D နှင့်ပတ်သက်သောသိမှတ်ဖွယ်ရာများ',
                  style: TextStyle(
                    fontSize: FontSize.body2,
                    fontWeight: FontWeightManager.semibold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: ColorManager.primary),
              ),
              const Divider(indent: 10, endIndent: 50),
              ListTile(
                onTap: () => Navigator.pushNamed(context, AppRoutes.aboutApp),
                leading: const Text(
                  'App အကြောင်း',
                  style: TextStyle(
                    fontSize: FontSize.body2,
                    fontWeight: FontWeightManager.semibold,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: ColorManager.primary),
              ),
              const Divider(indent: 10, endIndent: 50),
              const SizedBox(height: 60),
              const Align(
                heightFactor: 2,
                child: Text(
                  'Wave Pay',
                  style: TextStyle(fontSize: FontSize.body2),
                ),
              ),
              const Align(
                child: Text(
                  '09777662003',
                  style: TextStyle(
                    fontSize: FontSize.body2,
                    fontWeight: FontWeightManager.semibold,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.white,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              padding: const EdgeInsets.only(right: 15),
              icon: const Icon(Icons.menu, color: ColorManager.primary),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                const Text(
                  'Points',
                  style: TextStyle(fontSize: FontSize.body2),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 55,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    //textAlign: TextAlign.center,
                    '100',
                    style: TextStyle(
                      fontSize: FontSize.body2,
                      color: ColorManager.white,
                      fontWeight: FontWeightManager.semibold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 11),
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Points စုရန်',
              style: TextStyle(
                fontSize: FontSize.body2,
                color: ColorManager.white,
                fontWeight: FontWeightManager.semibold,
              ),
            ),
          ),
          RadialMenu(
            isOpen: isOpen,
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            children: [
              RadialButton(
                text: 'ထိုးကွက်',
                onPress: () {
                  controller.lotteryByType(context: context, type: 'numbers');
                },
              ),
              RadialButton(
                text: '၀မ်းချိန်း',
                onPress: () {
                  controller.lotteryByType(
                      context: context, type: 'one_change');
                },
              ),
              RadialButton(
                text: 'Ch + Key',
                onPress: () {
                  controller.lotteryByType(context: context, type: 'ch_key');
                },
              ),
              RadialButton(
                text: 'မွေးကွက်',
                onPress: () {
                  controller.lotteryByType(
                      context: context, type: 'own_number');
                },
              ),
              RadialButton(
                text: 'လုံးပိုင်',
                onPress: () {
                  controller.lotteryByType(
                      context: context, type: 'lone_paing');
                },
              ),
              RadialButton(
                text: 'တစ်ကွက်ကောင်း',
                onPress: () {
                  controller.lotteryByType(
                      context: context, type: 'one_number');
                },
              ),
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
            InkWell(
              onTap: () {
                _launchViber();
              },
              child: SizedBox(
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
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
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
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
