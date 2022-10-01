class FacilityModel {
  FacilityModel({int? id, String? name, String? image, bool? isSelected}) {
    _id = id;
    _name = name;
    _image = image;
    _isSelected = isSelected;
  }

  FacilityModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }

  int? _id;
  String? _name;
  String? _image;
  bool? _isSelected;

  FacilityModel copyWith({
    int? id,
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      FacilityModel(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
      );

  int? get id => _id;

  String? get name => _name;

  String? get image => _image;

  bool? get isSelected => _isSelected;

  set isSelected(bool? isSelected) => _isSelected = isSelected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }
}
