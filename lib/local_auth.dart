import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final localAuth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await localAuth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;
    try {
      return await localAuth.authenticate(
          localizedReason: 'To access your account, scan your fingerprint.',
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException {
      return false;
    }
  }
}
