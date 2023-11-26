import 'package:url_launcher/url_launcher.dart';

import 'methods.dart';

class CalendarHandler {
  static Future<void> addCalendar() async {
    final url = EnvironmentHandler.calendarEvent;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not open calendar $url';
    }
  }

  static final _eventDate = EnvironmentHandler.side == 'lelaki'
      ? DateTime(2023, 05, 01)
      : DateTime(2023, 04, 27);
  static final _today = DateTime.now();
  static int get dayToEvent => _eventDate.difference(_today).inDays;
}
