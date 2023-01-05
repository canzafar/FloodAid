class User
{
  int user_id;
  String name;
  String email;
  String user_password;

  User(
      this.user_id,
      this.name,
      this.email,
      this.user_password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json["user_id"]),
    json["name"],
    json["email"],
    json["user_password"],
  );

  Map<String, dynamic> toJson()=>
      {
        'user_id': user_id.toString(),
        'name' : name,
        'email' : email,
        'user_password' : user_password,
      };

}