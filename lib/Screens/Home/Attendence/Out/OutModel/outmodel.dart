class OutModel {
  String? message;
  Data? data;

  OutModel({this.message, this.data});

  OutModel.fromJson(Map<String, dynamic> json) {
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
  String? createdat;
  String? workdetails;
  String? sId;
  int? iV;

  Data({this.user, this.createdat, this.workdetails, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    createdat = json['createdat'];
    workdetails = json['workdetails'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['createdat'] = this.createdat;
    data['workdetails'] = this.workdetails;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
