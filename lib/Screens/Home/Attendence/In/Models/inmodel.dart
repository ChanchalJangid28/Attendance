class InModel {
  String? message;
  Data? data;

  InModel({this.message, this.data});

  InModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? user;
  String? createat;
  String? sId;
  int? iV;

  Data({this.user, this.createat, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    createat = json['createat'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['createat'] = this.createat;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
