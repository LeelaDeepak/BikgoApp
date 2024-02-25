class SignUpUser {
  late final String Name;
  late final String Email;
  late final String DateOfBirth;
  late final String UserProfilepic;

  SignUpUser(
      {required this.Name,
      required this.Email,
      required this.DateOfBirth,
      required this.UserProfilepic});

  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Email': Email,
        'DateOfBirth': DateOfBirth,
        'UserProfilepic': UserProfilepic
      };

  static SignUpUser fromJson(Map<String, dynamic> json) => SignUpUser(
      Name: json['Name'],
      Email: json['Email'],
      DateOfBirth: json['DateOfBirth'],
      UserProfilepic: json['UserProfilepic']);
}
