import 'dart:convert';

// To parse this JSON data, do
//
//     final cameraEntries = cameraEntriesFromJson(jsonString);

List<CameraEntry> cameraEntriesFromJson(String str) => List<CameraEntry>.from(
    json.decode(str).map((x) => CameraEntry.fromJson(x)));

String cameraEntriesToJson(List<CameraEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CameraEntry {
  String model;
  String pk;
  Fields fields;

  CameraEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory CameraEntry.fromJson(Map<String, dynamic> json) => CameraEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int price;
  String description;
  double stock;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.description,
    required this.stock,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "stock": stock,
      };
}
