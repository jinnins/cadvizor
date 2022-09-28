class Color {
  Color({
      required this.id,
      required this.name,
      required this.code,
      required this.argb,
      required this.hex,});

  Color.fromJson(dynamic json) {
    id = json['_id'];
    name = json['Name'];
    code = json['Code'];
    argb = json['Argb'];
    hex = json['Hex'];
  }
  late String id;
  late String name;
  late String code;
  late int argb;
  late String hex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['Name'] = name;
    map['Code'] = code;
    map['Argb'] = argb;
    map['Hex'] = hex;
    return map;
  }

}