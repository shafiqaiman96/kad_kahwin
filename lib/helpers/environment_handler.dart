import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentHandler {
  static String get fileName =>
      const bool.fromEnvironment('isLelaki') ? 'env.lelaki' : 'env.perempuan';

  static String get side => dotenv.env['SIDE'] ?? '';
  static double get lat => double.parse(dotenv.env['LAT'] ?? '');
  static double get lon => double.parse(dotenv.env['LON'] ?? '');
  static String get appId => dotenv.env['APP_ID'] ?? '';
  static String get calendarEvent => dotenv.env['CALENDAR_EVENT'] ?? '';
  static String get wishCollection => dotenv.env['WISH_COLLECTION'] ?? '';
}
