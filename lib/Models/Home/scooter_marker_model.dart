class ScooterMarkerModel {
  int id;
  String code;
  String imei;
  int status;
  int battery;
  double lat;
  double lng;
  String simNumber;
  String model;
  dynamic serialNumber;

  ScooterMarkerModel({
    required this.id,
    required this.code,
    required this.imei,
    required this.status,
    required this.battery,
    required this.lat,
    required this.lng,
    required this.simNumber,
    required this.model,
    required this.serialNumber,
  });

  static List<ScooterMarkerModel> listFromJson(List data) =>
      data.map((e) => ScooterMarkerModel.fromJson(e)).toList();


  factory ScooterMarkerModel.fromJson(Map<String, dynamic> json) =>
      ScooterMarkerModel(
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
