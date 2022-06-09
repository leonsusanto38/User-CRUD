class DataUser {
  final String dataEmail;
  final String dataName;
  final String dataPhoto;
  final String dataAddress;
  final String dataDescription;

  DataUser(
      {required this.dataEmail,
      required this.dataName,
      required this.dataPhoto,
      required this.dataAddress,
      required this.dataDescription});

  Map<String, dynamic> toJson() {
    return {
      "email": dataEmail,
      "name": dataName,
      "photo": dataPhoto,
      "address": dataAddress,
      "description": dataDescription,
    };
  }

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      dataEmail: json['email'],
      dataName: json['name'],
      dataPhoto: json['photo'],
      dataAddress: json['address'],
      dataDescription: json['description'],
    );
  }
}
