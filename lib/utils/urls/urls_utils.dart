import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:limboscan/utils/toast/toast_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';
import 'package:share_plus/share_plus.dart';

void copy({required String text, required BuildContext context}) {
  Clipboard.setData(ClipboardData(text: text));

  vibrate();

  toast('Copiado!');
}

void share(String text) {
  Share.share(text);
}

void openUrl(String text) async {
  try {
    final bool isUrl =
        ['.com', 'http', 'www.', '.io', '.pdf'].any((e) => text.contains(e));

    String url = isUrl ? text : 'https://www.google.com/search?q=$text';

    if (isUrl && !url.contains('http') && !url.contains('www.')) {
      url = 'https://$url';
    }

    await launchUrl(Uri.parse(url));
  } catch (e) {
    toast('No se ha podido abrir el enlace');
  }
}

Future<void> vibrate() async {
  final bool hasVibrator = await Vibration.hasVibrator() ?? false;

  if (!hasVibrator) return;

  final bool hasAmplitudeControl =
      await Vibration.hasCustomVibrationsSupport() ?? false;

  if (hasAmplitudeControl) {
    await Vibration.vibrate(duration: 200);
  } else {
    await Vibration.vibrate();
  }
}
