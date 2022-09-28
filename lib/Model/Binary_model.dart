class BinaryModel {
  BinaryModel({
      required this.id,
      required this.binary,});

  BinaryModel.fromJson(dynamic json) {
    id = json['_id'];
    binary = json['binary'];
  }
  late String id;
  late String binary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['binary'] = binary;
    return map;
  }
}