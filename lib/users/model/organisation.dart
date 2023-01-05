class Organisation
{
  int organisation_id;
  String organisation_name; //yehbnyawa hai
  String organisation_email;
  String organisation_password;

  Organisation(
      this.organisation_id,
      this.organisation_name,
      this.organisation_email,
      this.organisation_password,
      );

  factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
    int.parse(json["organisation_id"]),
    json["organisation_name"],
    json["organisation_email"],
    json["organisation_password"],
  );

  Map<String, dynamic> toJson()=>
      {
        'organisation_id': organisation_id.toString(),
        'organisation_name' : organisation_name,
        'organisation_email' : organisation_email,
        'organisation_password' : organisation_password,
      };

}