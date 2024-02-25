class SignUpRenter {
  late final String RenterName;
  late final String RenterPhoneNumber;
  late final String RenterAddress;
  late final String RenterAge;
  late final String RenterBikeModel;
  late final String RenterBikeNumber;
  late final String IsVerified;
  late final String Email;
  late final String RenterBikeInsurance;
  late final String RenterBikePhoto;
  late final String RenterBikePollution;
  late final String RenterBikeRC;
  late final String RenterLicenseBack;
  late final String RenterLicenseFront;
  late final String RenterSelfie;

  SignUpRenter({
    required this.RenterName,
    required this.RenterPhoneNumber,
    required this.RenterAddress,
    required this.RenterAge,
    required this.RenterBikeModel,
    required this.RenterBikeNumber,
    required this.IsVerified,
    required this.Email,
    required this.RenterBikeInsurance,
    required this.RenterBikePhoto,
    required this.RenterBikePollution,
    required this.RenterBikeRC,
    required this.RenterLicenseBack,
    required this.RenterLicenseFront,
    required this.RenterSelfie,
  });

  Map<String, dynamic> toJson() => {
        'Renter-Name': RenterName,
        'Renter-PhoneNumber': RenterPhoneNumber,
        'Renter-Address': RenterAddress,
        'Renter-Age': RenterAge,
        'Renter-BikeModel': RenterBikeModel,
        'Renter-BikeNumber': RenterBikeNumber,
        'IsVerified': IsVerified,
        'Email': Email,
        'Renter-Bike-Insurance': RenterBikeInsurance,
        'Renter-Bike-Photo': RenterBikePhoto,
        'Renter-Bike-Pollution': RenterBikePollution,
        'Renter-Bike-RC': RenterBikeRC,
        'Renter-License-Back': RenterLicenseBack,
        'Renter-License-Front': RenterLicenseFront,
        'Renter-Selfie': RenterSelfie,
      };

  static SignUpRenter fromJson(Map<String, dynamic> json) => SignUpRenter(
      RenterBikeModel: json['Renter-Name'],
      RenterPhoneNumber: json['Renter-PhoneNumber'],
      RenterAddress: json['Renter-Address'],
      RenterAge: json['Renter-Age'],
      RenterBikeNumber: json['Renter-BikeNumber'],
      RenterName: json['Renter-Name'],
      IsVerified: json['IsVerified'],
      Email: json['Email'],
      RenterLicenseBack: json['Renter-License-Back'],
      RenterLicenseFront: json['Renter-License-Front'],
      RenterBikeInsurance: json['Renter-Bike-Insurance'],
      RenterBikePhoto: json['Renter-Bike-Photo'],
      RenterBikePollution: json['Renter-Bike-Pollution'],
      RenterSelfie: json['Renter-Selfie'],
      RenterBikeRC: json['Renter-Bike-RC']);
}
