import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../data/adservice/ad_service.dart';
import '../data/model/model.dart';
import '../domain/controller.dart';
import '../resource/resource.dart';
import '../widget/radial_menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

/* Future<void> _launchViber() async {
  await launchUrl(
    Uri.parse('viber://pa?chatURI=09777662003'),
    mode: LaunchMode.externalNonBrowserApplication,
  );
} */

void _launchFB() {
  String fbProtocolUrl = 'fb://page/100083066690008';
  String fallBackUrl = 'https://www.facebook.com/2dboedaw';
  canLaunchUrlString(fbProtocolUrl).then((canLaunch) {
    if (canLaunch) {
      launchUrlString(fbProtocolUrl,
          mode: LaunchMode.externalNonBrowserApplication);
    } else {
      launchUrlString(fallBackUrl,
          mode: LaunchMode.externalNonBrowserApplication);
    }
  });
}

class _HomeState extends State<Home> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  String device = '00000000-89ABCDEF-01234567-89ABCDEF';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getPointsByDeviceID(deviceID: device);
    });
    _createBannerAd();
    _createInterstitialAd();
    _createRewardedAd();
  }

  void _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdMobService.rewardedAdUnitId!,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
        onAdFailedToLoad: (error) => setState(() => _rewardedAd = null),
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
        },
      );
      _rewardedAd!.show(
        //TODO: increase points
        onUserEarnedReward: (ad, reward) => setState(() {}),
      );
      _rewardedAd = null;
    }
  }

  final controller = Get.find<LotteryController>();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
                _showInterstitialAd();
              },
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
                  'Points  ',
                  style: TextStyle(fontSize: FontSize.body2),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    //margin: const EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    width: 55,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.obx(
                      (state) {
                        ApiResponse model = state;
                        return Text(
                          model.deviceId.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: FontSize.body2,
                            color: ColorManager.white,
                            fontWeight: FontWeightManager.semibold,
                          ),
                        );
                      },
                    ),

                    /* Text(
                      '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: FontSize.body2,
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.semibold,
                      ),
                    ), */
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          InkWell(
            splashColor: ColorManager.red,
            highlightColor: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              _showRewardedAd();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(3),
              height: 45,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'Points စုရန်',
                style: TextStyle(
                  fontSize: FontSize.body2,
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.semibold,
                ),
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
              /* RadialButton(
                text: 'Ch + Key',
                onPress: () {
                  controller.lotteryByType(context: context, type: 'ch_key');
                },
              ), */
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
      bottomNavigationBar: SizedBox(
        height: screenHeight * 0.2,
        width: double.infinity,
        child: Column(
          children: [
            _bannerAd == null
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    height: screenHeight * 0.1,
                    child: AdWidget(ad: _bannerAd!),
                  ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      //_launchViber();
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
                    onTap: () {
                      _launchFB();
                    },
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
          ],
        ),
      ),
    );
  }
}
