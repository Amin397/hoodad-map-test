class UserInfoModel {
  int? vehicleType;
  String? plateNumber;
  String? nationalCardImage;
  int? id;
  String? name;
  String? family;
  String? nationalCode;
  String? mobile;
  int? roleId;
  int? status;
  int? gender;

  UserInfoModel({
    this.vehicleType,
    this.plateNumber,
    this.nationalCardImage,
    this.id,
    this.name,
    this.family,
    this.nationalCode,
    this.mobile,
    this.roleId,
    this.status,
    this.gender,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    vehicleType: json["vehicleType"],
    plateNumber: json["plateNumber"],
    nationalCardImage: json["nationalCardImage"],
    id: json["id"],
    name: json["name"],
    family: json["family"],
    nationalCode: json["nationalCode"],
    mobile: json["mobile"],
    roleId: json["roleId"],
    status: json["status"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "vehicleType": vehicleType,
    "plateNumber": plateNumber,
    "nationalCardImage": nationalCardImage,
    "id": id,
    "name": name,
    "family": family,
    "nationalCode": nationalCode,
    "mobile": mobile,
    "roleId": roleId,
    "status": status,
    "gender": gender,
  };
}
