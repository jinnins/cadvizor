import 'Color.dart';
import 'Material.dart';

class JWire {
  JWire({
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
      required this.crossSectionArea,
      required this.americanWireGage,
      required this.outsideDiameter,
      required this.material,
      required this.allowableCurrent,
      required this.contactResistance,});

  JWire.fromJson(dynamic json) {
    id = json['_id'];
    status = json['Status'];
    symbolIds = json['SymbolIds'];
    internalNumber = json['InternalNumber'];
    supplierNumber = json['SupplierNumber'];
    manufacturerNumber = json['ManufacturerNumber'];
    cost = json['Cost'];
    color = (json['Color'] != null ? Color.fromJson(json['Color']) : null)!;
    description = json['Description'];
    alias = json['Alias'];
    type = json['Type'];
    revisionId = json['RevisionId'];
    manufacturer = json['Manufacturer'];
    unitResistance = json['UnitResistance'];
    crossSectionArea = json['CrossSectionArea'];
    americanWireGage = json['AmericanWireGage'];
    outsideDiameter = json['OutsideDiameter'];
    material = (json['Material'] != null ? Material.fromJson(json['Material']) : null)!;
    allowableCurrent = json['AllowableCurrent'];
    contactResistance = json['ContactResistance'];
  }
  late String id;
  late String status;
  late String symbolIds;
  late String internalNumber;
  late String supplierNumber;
  late String manufacturerNumber;
  late String cost;
  late Color color;
  late String description;
  late String alias;
  late String type;
  late String revisionId;
  late String manufacturer;
  late String unitResistance;
  late double crossSectionArea;
  late String americanWireGage;
  late double outsideDiameter;
  late Material material;
  late double allowableCurrent;
  late String contactResistance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['CrossSectionArea'] = crossSectionArea;
    map['AmericanWireGage'] = americanWireGage;
    map['OutsideDiameter'] = outsideDiameter;
    if (material != null) {
      map['Material'] = material.toJson();
    }
    map['AllowableCurrent'] = allowableCurrent;
    map['ContactResistance'] = contactResistance;
    return map;
  }

}