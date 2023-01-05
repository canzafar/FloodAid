import 'package:floodaid/users/userPreferences/volunteer_preferences.dart';
import 'package:get/get.dart';

import '../model/volunteer.dart';

class CurrentVolunteer extends GetxController {
  Rx<Volunteer> _currentVolunteer = Volunteer(0, '', '', '').obs;

  Volunteer get volunteer => _currentVolunteer.value;

  static Future<Volunteer> getVolunteerInfo() async {
    Volunteer? getVolunteerInfoFromLocalStorage =
        await RememberVolunteerPrefs.readVolunteerInfo();
    return getVolunteerInfoFromLocalStorage!;
  }
}
