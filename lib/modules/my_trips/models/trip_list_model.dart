class TripListModel {
  bool? status;
  String? message;
  List<Result>? result;
  int? timestamp;

  TripListModel({this.status, this.message, this.result, this.timestamp});

  TripListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Result {
  String? id;
  String? tripNumber;
  String? name;
  String? createdAt;

  Result({this.id, this.tripNumber, this.name, this.createdAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripNumber = json['tripNumber'];
    name = json['name'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tripNumber'] = this.tripNumber;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    return data;
  }
}