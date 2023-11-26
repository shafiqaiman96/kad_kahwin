import 'package:url_launcher/url_launcher.dart';

class ContactHandler {
  static Future<void> openWhatsapp(String phoneNumber) async {
    final whatsappURL = 'https://api.whatsapp.com/send?phone=6$phoneNumber';

    if (await canLaunchUrl(Uri.parse(whatsappURL))) {
      await launchUrl(Uri.parse(whatsappURL));
    } else {
      throw 'Could not open WhatsApp $whatsappURL';
    }
  }

  static Future<void> openCall(String phoneNumber) async {
    final callURL = 'tel://$phoneNumber';

    if (await canLaunchUrl(Uri.parse(callURL))) {
      await launchUrl(Uri.parse(callURL));
    } else {
      throw 'Could not open OS Call $callURL';
    }
  }
}
