class AddNoteModel {
  String? message;
  Response? response;

  AddNoteModel({this.message, this.response});

  AddNoteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? userid;
  String? note;
  String? sId;
  int? iV;

  Response({this.userid, this.note, this.sId, this.iV});

  Response.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    note = json['note'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['note'] = this.note;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
