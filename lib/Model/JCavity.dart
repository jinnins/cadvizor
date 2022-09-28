import 'CavityDetails.dart';

class JCavity {
  JCavity({
      required this.id,
      required this.parentId,
      required this.cavityDetails,});

  JCavity.fromJson(dynamic json) {
    id = json['_id'];
    parentId = json['ParentId'];
    if (json['CavityDetails'] != null) {
      cavityDetails = [];
      json['CavityDetails'].forEach((v) {
        cavityDetails.add(CavityDetails.fromJson(v));
      });
    }
  }
  late String id;
  late String parentId;
  late List<CavityDetails> cavityDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['ParentId'] = parentId;
    if (cavityDetails != null) {
      map['CavityDetails'] = cavityDetails.map((v) => v.toJson()).toList();
    }
    return map;
  }

}