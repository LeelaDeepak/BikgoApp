class Userswala {
  late final String RiderName;
  late final String RiderPhoneNumber;
  late final String RiderAddress;
  late final String RiderAge;
  late final String IsVerified;

  Userswala({
    required this.RiderName,
    required this.RiderPhoneNumber,
    required this.RiderAddress,
    required this.RiderAge,
    required this.IsVerified,
  });

  Map<String, dynamic> toJson() => {
        'Rider-Name': RiderName,
        'Rider-PhoneNumber': RiderPhoneNumber,
        'Rider-Address': RiderAddress,
        'Rider-Age': RiderAge,
        'IsVerified': IsVerified
      };

  static Userswala fromJson(Map<String, dynamic> json) => Userswala(
      RiderPhoneNumber: json['Rider-PhoneNumber'],
      RiderAddress: json['Rider-Address'],
      RiderAge: json['Rider-Age'],
      IsVerified: json['IsVerified'],
      RiderName: json['Rider-Name']);
}
