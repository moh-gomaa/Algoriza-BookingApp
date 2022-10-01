import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelModel {
  HotelModel({
    Status? status,
    HotelDetailsModel? data,
  }) {
    _status = status;
    _data = data;
  }

  HotelModel.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data =
        json['data'] != null ? HotelDetailsModel.fromJson(json['data']) : null;
  }

  Status? _status;
  HotelDetailsModel? _data;

  HotelModel copyWith({
    Status? status,
    HotelDetailsModel? data,
  }) =>
      HotelModel(
        status: status ?? _status,
        data: data ?? _data,
      );

  Status? get status => _status;

  HotelDetailsModel? get data => _data;

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

class HotelDetailsModel {
  Data({
    int? currentPage,
    List<HotelDataModel>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  HotelDetailsModel.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(HotelDataModel.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  int? _currentPage;
  List<HotelDataModel>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  String? _perPage;
  dynamic _prevPageUrl;
  int? _to;
  int? _total;

  HotelDetailsModel copyWith({
    int? currentPage,
    List<HotelDataModel>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      Data(
        currentPage: currentPage ?? _currentPage,
        data: data ?? _data,
        firstPageUrl: firstPageUrl ?? _firstPageUrl,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        lastPageUrl: lastPageUrl ?? _lastPageUrl,
        links: links ?? _links,
        nextPageUrl: nextPageUrl ?? _nextPageUrl,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        prevPageUrl: prevPageUrl ?? _prevPageUrl,
        to: to ?? _to,
        total: total ?? _total,
      );

  int? get currentPage => _currentPage;

  List<HotelDataModel>? get data => _data;

  String? get firstPageUrl => _firstPageUrl;

  int? get from => _from;

  int? get lastPage => _lastPage;

  String? get lastPageUrl => _lastPageUrl;

  List<Links>? get links => _links;

  dynamic get nextPageUrl => _nextPageUrl;

  String? get path => _path;

  String? get perPage => _perPage;

  dynamic get prevPageUrl => _prevPageUrl;

  int? get to => _to;

  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }

  dynamic _url;
  String? _label;
  bool? _active;

  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? _url,
        label: label ?? _label,
        active: active ?? _active,
      );

  dynamic get url => _url;

  String? get label => _label;

  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

class HotelDataModel {
  Data({
    int? id,
    String? name,
    String? description,
    String? price,
    String? address,
    String? longitude,
    String? latitude,
    String? rate,
    String? createdAt,
    String? updatedAt,
    List<HotelImages>? hotelImages,
    List<Facilities>? facilities,
    BitmapDescriptor? icon,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _address = address;
    _longitude = longitude;
    _latitude = latitude;
    _rate = rate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _hotelImages = hotelImages;
    _facilities = facilities;
    _icon = icon;
  }

  HotelDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _address = json['address'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _rate = json['rate'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['hotel_images'] != null) {
      _hotelImages = [];
      json['hotel_images'].forEach((v) {
        _hotelImages?.add(HotelImages.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      _facilities = [];
      json['facilities'].forEach((v) {
        _facilities?.add(Facilities.fromJson(v));
      });
    }
  }

  int? _id;
  String? _name;
  String? _description;
  String? _price;
  String? _address;
  String? _longitude;
  String? _latitude;
  String? _rate;
  String? _createdAt;
  String? _updatedAt;
  List<HotelImages>? _hotelImages;
  List<Facilities>? _facilities;
  BitmapDescriptor? _icon;

  HotelDataModel copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    String? address,
    String? longitude,
    String? latitude,
    String? rate,
    String? createdAt,
    String? updatedAt,
    List<HotelImages>? hotelImages,
    List<Facilities>? facilities,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        price: price ?? _price,
        address: address ?? _address,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
        rate: rate ?? _rate,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        hotelImages: hotelImages ?? _hotelImages,
        facilities: facilities ?? _facilities,
      );

  int? get id => _id;

  String? get name => _name;

  String? get description => _description;

  String? get price => _price;

  String? get address => _address;

  String? get longitude => _longitude;

  String? get latitude => _latitude;

  String? get rate => _rate;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<HotelImages>? get hotelImages => _hotelImages;

  List<Facilities>? get facilities => _facilities;

  BitmapDescriptor? get icon => _icon;

   set icon(BitmapDescriptor? icon) => _icon = icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['address'] = _address;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['rate'] = _rate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_hotelImages != null) {
      map['hotel_images'] = _hotelImages?.map((v) => v.toJson()).toList();
    }
    if (_facilities != null) {
      map['facilities'] = _facilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Facilities {
  Facilities({
    int? id,
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Facilities.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _name;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  Facilities copyWith({
    int? id,
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Facilities(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get name => _name;

  String? get image => _image;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class HotelImages {
  HotelImages({
    int? id,
    String? hotelId,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _hotelId = hotelId;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  HotelImages.fromJson(dynamic json) {
    _id = json['id'];
    _hotelId = json['hotel_id'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _hotelId;
  String? _image;
  dynamic _createdAt;
  dynamic _updatedAt;

  HotelImages copyWith({
    int? id,
    String? hotelId,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      HotelImages(
        id: id ?? _id,
        hotelId: hotelId ?? _hotelId,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get hotelId => _hotelId;

  String? get image => _image;

  dynamic get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hotel_id'] = _hotelId;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class Status {
  Status({
    String? type,
  }) {
    _type = type;
  }

  Status.fromJson(dynamic json) {
    _type = json['type'];
  }

  String? _type;

  Status copyWith({
    String? type,
  }) =>
      Status(
        type: type ?? _type,
      );

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    return map;
  }
}
