class UserInfoModel {
  int? id;
  String? code;
  String? imei;
  int? status;
  int? battery;
  int? lat;
  int? lng;
  String? simNumber;
  String? model;
  dynamic serialNumber;

  UserInfoModel({
    this.id,
    this.code,
    this.imei,
    this.status,
    this.battery,
    this.lat,
    this.lng,
    this.simNumber,
    this.model,
    this.serialNumber,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    id: json["id"],
    code: json["code"],
    imei: json["imei"],
    status: json["status"],
    battery: json["battery"],
    lat: json["lat"],
    lng: json["lng"],
    simNumber: json["simNumber"],
    model: json["model"],
    serialNumber: json["serialNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "imei": imei,
    "status": status,
    "battery": battery,
    "lat": lat,
    "lng": lng,
    "simNumber": simNumber,
    "model": model,
    "serialNumber": serialNumber,
  };
}
