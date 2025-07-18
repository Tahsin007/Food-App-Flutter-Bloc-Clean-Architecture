import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String? apiUrl = dotenv.env['API_URL'];
  static const contentType = 'application/json; charset=UTF-8';
  static const zoneId = '[1]';
  static const latitude = '23.735129';
  static const longitude = '90.425614';
}
