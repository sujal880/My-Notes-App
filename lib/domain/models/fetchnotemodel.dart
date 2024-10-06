class FetchNoteModel {
  String? message;
  List<Data>? data;

  FetchNoteModel({this.message, this.data});

  FetchNoteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userid;
  String? note;
  int? iV;

  Data({this.sId, this.userid, this.note, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userid = json['userid'];
    note = json['note'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userid'] = this.userid;
    data['note'] = this.note;
    data['__v'] = this.iV;
    return data;
  }
}
