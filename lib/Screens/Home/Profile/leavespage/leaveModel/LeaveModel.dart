class LeaveModel {
  String? message;
  Data? data;

  LeaveModel({this.message, this.data});

  LeaveModel.fromJson(Map<String, dynamic> json) {
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
  String? startleavedate;
  String? endleavedate;
  String? reason;
  String? createdat;
  String? sId;
  int? iV;

  Data(
      {this.user,
        this.startleavedate,
        this.endleavedate,
        this.reason,
        this.createdat,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    startleavedate = json['startleavedate'];
    endleavedate = json['endleavedate'];
    reason = json['reason'];
    createdat = json['createdat'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['startleavedate'] = this.startleavedate;
    data['endleavedate'] = this.endleavedate;
    data['reason'] = this.reason;
    data['createdat'] = this.createdat;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
