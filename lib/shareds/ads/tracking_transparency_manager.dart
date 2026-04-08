import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class TrackingTransparencyManager {
  TrackingTransparencyManager._();

  static TrackingStatus? _cachedStatus;
  static bool _didRequestInThisSession = false;

  static bool get isPersonalizedAdsAllowedCached =>
      !Platform.isIOS || _cachedStatus == TrackingStatus.authorized;

  static Future<TrackingStatus> preloadStatus() async {
    if (!Platform.isIOS) {
      _cachedStatus = TrackingStatus.notSupported;
      return _cachedStatus!;
    }

    _cachedStatus = await AppTrackingTransparency.trackingAuthorizationStatus;
    return _cachedStatus!;
  }

  static Future<TrackingStatus> requestIfNeeded() async {
    if (!Platform.isIOS) {
      _cachedStatus = TrackingStatus.notSupported;
      return TrackingStatus.notSupported;
    }

    final status = _cachedStatus ??
        await AppTrackingTransparency.trackingAuthorizationStatus;

    _cachedStatus = status;

    if (status == TrackingStatus.notDetermined && !_didRequestInThisSession) {
      _didRequestInThisSession = true;
      _cachedStatus =
          await AppTrackingTransparency.requestTrackingAuthorization();
      return _cachedStatus!;
    }

    return status;
  }

  static Future<bool> isAuthorized() async {
    if (!Platform.isIOS) return true;

    final status = _cachedStatus ??
        await AppTrackingTransparency.trackingAuthorizationStatus;
    _cachedStatus = status;
    return status == TrackingStatus.authorized;
  }
}
