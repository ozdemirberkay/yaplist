import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager {
  InterstitialAd? _interstitialAd;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-8385820706890324/3284865232'
      : 'ca-app-pub-8385820706890324/7424254946';

  void loadAd() {
    InterstitialAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print(error);
          },
        ));
  }

  void showAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    }
  }
}

class BannerAdManager {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-8385820706890324/9757902109'
      : 'ca-app-pub-8385820706890324/9527674109';

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isLoaded = true;
        },
        onAdFailedToLoad: (ad, err) {
          print(err);

          ad.dispose();
        },
      ),
    )..load();
  }

  Widget getBannerAd() {
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
