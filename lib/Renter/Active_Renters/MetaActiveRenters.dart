class UsersmetaforRider {
  late final String BikeOwner;
  late final String BikeOwnerPhoto;
  late final String BikePhoto;
  late final String Rents;
  late final String VechileModel;
  late final String VechileNumber;

  UsersmetaforRider({
    required this.BikeOwner,
    required this.BikeOwnerPhoto,
    required this.BikePhoto,
    required this.Rents,
    required this.VechileModel,
    required this.VechileNumber,
  });

  Map<String, dynamic> toJson() => {
        'Bike-Owner': BikeOwner,
        'Bike-Owner-Photo': BikeOwnerPhoto,
        'Bike-Photo': BikePhoto,
        'Rents': Rents,
        'Vehicle-Model': VechileModel,
        'Vehicle-Number': VechileNumber,
      };

  static UsersmetaforRider fromJson(Map<String, dynamic> json) =>
      UsersmetaforRider(
        BikeOwner: json['Bike-Owner'],
        BikeOwnerPhoto: json['Bike-Owner-Photo'],
        BikePhoto: json['Bike-Photo'],
        Rents: json['Rents'],
        VechileModel: json['Vehicle-Model'],
        VechileNumber: json['Vehicle-Number'],
      );
}
