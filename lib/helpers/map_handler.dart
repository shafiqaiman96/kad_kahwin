import 'package:url_launcher/url_launcher.dart';

class MapHandler {
  static Future<void> _openerHandler(String url, String fallbackUrl) async {
    try {
      bool launched = await launchUrl(Uri.parse(url));
      if (!launched) {
        await launchUrl(Uri.parse(fallbackUrl));
      }
    } catch (e) {
      await launchUrl(Uri.parse(fallbackUrl));
    }
  }

  static Future<void> launchWaze(double lat, double lng) async {
    final url = 'waze://?ll=${lat.toString()},${lng.toString()}';
    final fallbackUrl = 'https://waze.com/ul?ll=$lat,$lng&navigate=yes';
    await _openerHandler(url, fallbackUrl);
  }

  static Future<void> launchGoogleMaps(double lat, double lng) async {
    // final url = 'google.navigation:q=${lat.toString()},${lng.toString()}';

    final fallbackUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    await _openerHandler(fallbackUrl, fallbackUrl);
  }
}
