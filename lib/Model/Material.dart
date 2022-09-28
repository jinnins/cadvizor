class Material {
  Material({
      required this.name,
      required this.code,});

  Material.fromJson(dynamic json) {
    name = json['Name'];
    code = json['Code'];
  }
  late String name;
  late String code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['Code'] = code;
    return map;
  }

}