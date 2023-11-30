import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager {
  static final InterstitialAdManager _instance =
      InterstitialAdManager._internal();
  static InterstitialAdManager get instance => _instance;
  InterstitialAdManager._internal();

  InterstitialAd? _interstitialAd;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-8385820706890324/3284865232'
      : 'ca-app-pub-8385820706890324/7424254946';

  Future<void> _loadAd() async {
    await InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            _interstitialAd = null;
          },
        ));
  }

  Future<void> loadAndShowAd() async {
    await _loadAd();
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    }
  }
}

class BannerAdManager {
  static final BannerAdManager _instance = BannerAdManager._internal();
  static BannerAdManager get instance => _instance;
  BannerAdManager._internal();

  BannerAd? _bannerAd;
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-8385820706890324/9757902109'
      : 'ca-app-pub-8385820706890324/9527674109';

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, err) {
          _bannerAd = null;
          ad.dispose();
        },
      ),
    )..load();
  }

  Widget loadAndShowAd() {
    loadAd();
    if (_bannerAd == null) {
      return Container();
    }
    return SafeArea(
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}
