import 'package:floodaid/screens/menu.dart';
import 'package:floodaid/screens/organisation/organisation_screen.dart';
import 'package:floodaid/screens/volunteer/volunteer_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/screens/welcome_screen.dart';
import 'package:floodaid/users/authentication/login_screen.dart';
import 'package:floodaid/users/authentication/registration_screen.dart';
import 'package:floodaid/screens/donor/donate_screen.dart';
import 'package:get/get.dart';
import 'package:floodaid/screens/donor/money_page.dart';
import 'package:floodaid/screens/donor/food_page.dart';
import 'package:floodaid/screens/donor/health_page.dart';
import 'package:floodaid/screens/donor/shelter_page.dart';
import 'package:floodaid/screens/donor/clothing_page.dart';
import 'package:floodaid/screens/donor/hygiene_page.dart';
import 'package:floodaid/screens/donor/donor.dart';
import 'package:floodaid/screens/volunteer/pendingtasks_page.dart';
import 'package:floodaid/screens/volunteer/choosetasks_page.dart';
import 'package:floodaid/screens/volunteer/completedtasks_page.dart ';
import 'package:floodaid/screens/organisation/Inventory.dart';
import 'package:floodaid/screens/organisation/post_tasks.dart';
import 'package:floodaid/screens/myProfile/profile_page.dart';
import 'package:floodaid/screens/myProfile/edit_profile.dart';
import 'package:floodaid/screens/myProfile/change_password.dart';
import 'package:floodaid/data.dart';
import 'package:floodaid/screens/aboutUs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FloodAid());
}

class FloodAid extends StatefulWidget {
  @override
  State<FloodAid> createState() => _FloodAidState();
}

class _FloodAidState extends State<FloodAid> {
  @override
  void initState() {
    super.initState();
    retriveTasks();
    retriveOrganization();
  } //aya

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),//dosra kiya krna tha
      initialRoute: MenuScreen.id,
      routes: {
        MenuScreen.id: (context) => MenuScreen(),
        VolunteerScreen.id: (context) => VolunteerScreen(),
        Donate.id: (context) => Donate(),
        Donor.id: (context) => Donor(),
        OrganisationScreen.id: (context) => OrganisationScreen(),
        MyProfile.id: (context) => MyProfile(),
        EditProfile.id: (context) => EditProfile("", "",),
        ChangePassword.id: (context) => ChangePassword("", ""),
        InventoryScreen.id: (context) => InventoryScreen(),
        PostTasks.id: (context) => PostTasks(),
        ChooseTasks.id: (context) => ChooseTasks(),
        PendingTasks.id: (context) => PendingTasks(),
        CompletedTasks.id: (context) => CompletedTasks(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MoneyScreen.id: (context) => MoneyScreen(),
        FoodScreen.id: (context) => FoodScreen(),
        HealthScreen.id: (context) => HealthScreen(),
        ShelterScreen.id: (context) => ShelterScreen(),
        ClothingScreen.id: (context) => ClothingScreen(),
        HygieneScreen.id: (context) => HygieneScreen(),
        Micard.id: (context) => Micard()
      },
    );
  }
}
