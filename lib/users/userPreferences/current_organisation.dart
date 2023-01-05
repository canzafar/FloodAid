import 'package:floodaid/users/userPreferences/organisation_preferences.dart';
import 'package:get/get.dart';

import '../model/organisation.dart';

class CurrentOrganisation extends GetxController {
  Rx<Organisation> _currentOrganisation = Organisation(0, '', '', '').obs;

  Organisation get organisaion => _currentOrganisation.value;

  static Future<Organisation> getOrganisationInfo() async {
    Organisation? getOrganisationInfoFromLocalStorage =
        await RememberOrganisationPrefs.readOrganisationInfo();
    return getOrganisationInfoFromLocalStorage!;
  }
}
