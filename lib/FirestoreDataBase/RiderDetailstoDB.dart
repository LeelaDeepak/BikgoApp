class SignUpRider {
  late final String RiderName;
  late final String RiderPhoneNumber;
  late final String RiderAddress;
  late final String RiderAge;
  late final String IsVerified;

  SignUpRider({
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

  static SignUpRider fromJson(Map<String, dynamic> json) => SignUpRider(
        RiderName: json['Rider-Name'],
        RiderPhoneNumber: json['Rider-PhoneNumber'],
        RiderAddress: json['Rider-Address'],
        RiderAge: json['Rider-Age'],
        IsVerified: json['IsVerified'],
      );
}
