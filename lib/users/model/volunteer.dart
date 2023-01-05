class Volunteer
{
  int volunteer_id;
  String volunteer_name;
  String volunteer_email;
  String volunteer_password;

  Volunteer(
      this.volunteer_id,
      this.volunteer_name,
      this.volunteer_email,
      this.volunteer_password,
      );

  factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
    int.parse(json["volunteer_id"]),
    json["volunteer_name"],
    json["volunteer_email"],
    json["volunteer_password"],
  );

  Map<String, dynamic> toJson()=>
      {
        'volunteer_id': volunteer_id.toString(),
        'volunteer_name' : volunteer_name,
        'volunteer_email' : volunteer_email,
        'volunteer_password' : volunteer_password,
      };

}