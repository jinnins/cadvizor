import 'Color.dart';

class JConnector {
  JConnector({
    required this.id,
    required this.status,
    required this.symbolIds,
    required this.internalNumber,
    required this.supplierNumber,
    required this.manufacturerNumber,
    required this.cost,
    required this.color,
    required this.description,
    required this.alias,
    required this.type,
    required this.revisionId,
    required this.manufacturer,
    required this.unitResistance,
    required this.series,
    required this.gender,
    required this.subType,
    required this.numberOfCavities,
    required this.subitemIds,
    required this.cavityId,
    required this.insertionForce,
    required this.insertionSound,
  });

  JConnector.fromJson(dynamic json) {
    id = json?['_id'];
    status = json?['Status'];
    symbolIds = json?['SymbolIds'];
    internalNumber = json?['InternalNumber'];
    supplierNumber = json?['SupplierNumber'];
    manufacturerNumber = json?['ManufacturerNumber'];
    cost = json?['Cost'];
    color = (json?['Color'] != null ? Color.fromJson(json['Color']) : null)!;
    description = json?['Description'];
    alias = json?['Alias'];
    type = json?['Type'];
    revisionId = json?['RevisionId'];
    manufacturer = json?['Manufacturer'];
    unitResistance = json?['UnitResistance'];
    series = json?['Series'];
    gender = json?['Gender'];
    subType = json?['SubType'];
    numberOfCavities = json?['NumberOfCavities'];
    subitemIds =
        json?['SubitemIds'] != null ? json['SubitemIds'].cast<String>() : [];
    cavityId = json?['CavityId'];
    insertionForce = json?['InsertionForce'];
    insertionSound = json?['InsertionSound'];
  }

  late String? id;
  late String? status;
  late String? symbolIds;
  late String? internalNumber;
  late String? supplierNumber;
  late String? manufacturerNumber;
  late String? cost;
  late Color? color;
  late String? description;
  late String? alias;
  late String? type;
  late String? revisionId;
  late String? manufacturer;
  late String? unitResistance;
  late String? series;
  late String? gender;
  late String? subType;
  late int? numberOfCavities;
  late List<String>? subitemIds;
  late String? cavityId;
  late String? insertionForce;
  late String? insertionSound;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final color = this.color;
    map['_id'] = id;
    map['Status'] = status;
    map['SymbolIds'] = symbolIds;
    map['InternalNumber'] = internalNumber;
    map['SupplierNumber'] = supplierNumber;
    map['ManufacturerNumber'] = manufacturerNumber;
    map['Cost'] = cost;
    if (color != null) {
      map['Color'] = color.toJson();
    }
    map['Description'] = description;
    map['Alias'] = alias;
    map['Type'] = type;
    map['RevisionId'] = revisionId;
    map['Manufacturer'] = manufacturer;
    map['UnitResistance'] = unitResistance;
    map['Series'] = series;
    map['Gender'] = gender;
    map['SubType'] = subType;
    map['NumberOfCavities'] = numberOfCavities;
    map['SubitemIds'] = subitemIds;
    map['CavityId'] = cavityId;
    map['InsertionForce'] = insertionForce;
    map['InsertionSound'] = insertionSound;
    return map;
  }
}
