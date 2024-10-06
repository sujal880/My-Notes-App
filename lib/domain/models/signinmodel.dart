class SignInModel {
  String? message;
  Reponse? reponse;
  String? token;

  SignInModel({this.message, this.reponse, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    reponse =
    json['reponse'] != null ? new Reponse.fromJson(json['reponse']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reponse != null) {
      data['reponse'] = this.reponse!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Reponse {
  String? sId;
  String? email;
  String? password;
  String? username;
  int? iV;

  Reponse({this.sId, this.email, this.password, this.username, this.iV});

  Reponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['__v'] = this.iV;
    return data;
  }
}
