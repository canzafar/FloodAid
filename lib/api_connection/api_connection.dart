class API{
  static const hostConnect = "http://192.168.100.33/api_floodaid"; //192.168.10.16
  static const hostConnectUser = "$hostConnect/user";
  static const hostConnectOrganisation = "$hostConnect/organisation";
  static const hostConnectVolunteer = "$hostConnect/volunteer";

  //user
  static const validateEmail = "$hostConnect/user/validate_email.php";
  static const signup = "$hostConnect/user/signup.php";
  static const login = "$hostConnect/user/login.php";
  static const updateProfile = "$hostConnect/user/update_profile.php";
  static const deleteUser = "$hostConnect/user/delete_user.php";
  static const changePassword = "$hostConnect/user/change_password.php";
  static const sendMoney = "$hostConnect/donateFunctions/money.php";
  static const sendFood = "$hostConnect/donateFunctions/food.php";
  static const sendHealth = "$hostConnect/donateFunctions/health.php";
  static const sendShelter = "$hostConnect/donateFunctions/shelter.php";
  static const sendClothing = "$hostConnect/donateFunctions/clothing.php";
  static const sendHygiene = "$hostConnect/donateFunctions/hygiene.php";

  //organisation
  static const validateEmailO = "$hostConnect/organisation/validate_email.php";
  static const signupO = "$hostConnect/organisation/signup.php";
  static const loginO = "$hostConnect/organisation/login.php";
  static const updateProfileO = "$hostConnect/organisation/update_profile.php";
  static const deleteUserO = "$hostConnect/organisation/delete_user.php";
  static const changePasswordO = "$hostConnect/organisation/change_password.php";
  static const retrieveAllOrganization = "$hostConnect/organisation/retrieveAllOrganizations.php";
  static const uploadTask = "$hostConnect/organisationFunctions/postTasks.php";
  static const getMoney = "$hostConnect/organisationFunctions/getMoney.php";
  static const getFood = "$hostConnect/organisationFunctions/getFood.php";
  static const getHealth = "$hostConnect/organisationFunctions/getHealth.php";
  static const getShelter = "$hostConnect/organisationFunctions/getShelter.php";
  static const getClothing = "$hostConnect/organisationFunctions/getClothing.php";
  static const getHygiene = "$hostConnect/organisationFunctions/getHygiene.php";


  //volunteer
  static const validateEmailV = "$hostConnect/volunteer/validate_email.php";
  static const signupV = "$hostConnect/volunteer/signup.php";
  static const loginV = "$hostConnect/volunteer/login.php";
  static const updateProfileV = "$hostConnect/volunteer/update_profile.php";
  static const deleteUserV = "$hostConnect/volunteer/delete_user.php";
  static const changePasswordV = "$hostConnect/volunteer/change_password.php";
  static const retriveTasks = "$hostConnect/volunteerFunction/getTask.php";

}