class SettingsModel {
  bool status;
  Data data;

  SettingsModel({this.status,  this.data});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String about;
  String terms;

  Data({this.about, this.terms});

  Data.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['terms'] = this.terms;
    return data;
  }
}
