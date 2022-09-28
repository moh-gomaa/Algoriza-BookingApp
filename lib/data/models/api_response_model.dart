class ApiResponseModel {
  ApiResponseModel({
    Status? status,
    dynamic? data,
  }) {
    _status = status;
    _data = data;
  }

  ApiResponseModel.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data = json['data'] != null ? json['data'] : null;
  }

  Status? _status;
  dynamic? _data;

  ApiResponseModel copyWith({
    Status? status,
    dynamic? data,
  }) =>
      ApiResponseModel(
        status: status ?? _status,
        data: data ?? _data,
      );

  Status? get status => _status;

  dynamic? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Status {
  Status({
    String? type,
    Title? title,
  }) {
    _type = type;
    _title = title;
  }

  Status.fromJson(dynamic json) {
    _type = json['type'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }

  String? _type;
  Title? _title;

  Status copyWith({
    String? type,
    Title? title,
  }) =>
      Status(
        type: type ?? _type,
        title: title ?? _title,
      );

  String? get type => _type;

  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }
}

class Title {
  Title({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  Title.fromJson(dynamic json) {
    _ar = json['ar'];
    _en = json['en'];
  }

  String? _ar;
  String? _en;

  Title copyWith({
    String? ar,
    String? en,
  }) =>
      Title(
        ar: ar ?? _ar,
        en: en ?? _en,
      );

  String? get ar => _ar;

  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }
}
