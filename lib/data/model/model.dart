// To parse this JSON data, do
//
//     final increase = increaseFromJson(jsonString);

import 'dart:convert';

ApiResponse increaseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String increaseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    required this.success,
    required this.message,
    this.numbers,
    required this.description,
    this.type,
     this.deviceId,
    this.points,
  });

  bool success;
  String message;
  String? numbers;
  String? description;
  String? type;
  String? deviceId;
  int? points;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        numbers: json["numbers"] ?? '',
        description: json["description"] ?? '',
        type: json["type"] ?? '',
        deviceId: json["device_id"] ?? '',
        points: json["points"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "numbers": numbers ?? 0,
        "description": description,
        "type": type ?? 'lone_paing',
        "device_id": deviceId,
        "points": points,
      };
}
