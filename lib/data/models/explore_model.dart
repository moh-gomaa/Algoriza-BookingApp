import 'dart:convert';

ExploreModel exploreModelFromJson(String str) => ExploreModel.fromJson(json.decode(str));

String exploreModelToJson(ExploreModel data) => json.encode(data.toJson());

class ExploreModel {

  ExploreModel({
    this.status,
    this.data,
  });

  Status ?status;
  Data ?data;

  factory ExploreModel.fromJson(Map<String, dynamic> json) => ExploreModel(
    status: Status.fromJson(json["status"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status?.toJson(),
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int ?currentPage;
  List<Datum> ?data;
  String ?firstPageUrl;
  int ?from;
  int ?lastPage;
  String ?lastPageUrl;
  List<Link> ?links;
  dynamic nextPageUrl;
  String ?path;
  String ?perPage;
  dynamic prevPageUrl;
  int ?to;
  int ?total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.description,
    this.price,
    this.address,
    this.longitude,
    this.latitude,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.hotelImages,
    this.hotelFacilities,
  });

  int ?id;
  String ?name;
  String ?description;
  String ?price;
  String ?address;
  String ?longitude;
  String ?latitude;
  String ?rate;
  DateTime ?createdAt;
  DateTime ?updatedAt;
  List<Hotel> ?hotelImages;
  List<Hotel> ?hotelFacilities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    address: json["address"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    rate: json["rate"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    hotelImages: List<Hotel>.from(json["hotel_images"].map((x) => Hotel.fromJson(x))),
    hotelFacilities: List<Hotel>.from(json["hotel_facilities"].map((x) => Hotel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "rate": rate,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "hotel_images": List<dynamic>.from(hotelImages!.map((x) => x.toJson())),
    "hotel_facilities": List<dynamic>.from(hotelFacilities!.map((x) => x.toJson())),
  };
}

class Hotel {
  Hotel({
    this.id,
    this.hotelId,
    this.facilityId,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int ?id;
  String ?hotelId;
  String ?facilityId;
  dynamic createdAt;
  dynamic updatedAt;
  String ?image;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    hotelId: json["hotel_id"],
    facilityId: json["facility_id"] == null ? null : json["facility_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hotel_id": hotelId,
    "facility_id": facilityId == null ? null : facilityId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "image": image == null ? null : image,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String ?url;
  String ?label;
  bool ?active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

class Status {
  Status({
    this.type,
  });

  String ?type;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}
