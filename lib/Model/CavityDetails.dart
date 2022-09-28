class CavityDetails {
  CavityDetails({
      required this.number,
      required this.terminalIds,
      required this.sealIds,
      required this.waterproofType,
      required this.blankId,});

  CavityDetails.fromJson(dynamic json) {
    number = json['Number'];
    terminalIds = json['TerminalIds'] != null ? json['TerminalIds'].cast<String>() : [];
    sealIds = json['SealIds'] != null ? json['SealIds'].cast<String>() : [];
    waterproofType = json['WaterproofType'];
    blankId = json['BlankId'];
  }
  late int number;
  late List<String> terminalIds;
  late List<String> sealIds;
  late String waterproofType;
  late String blankId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Number'] = number;
    map['TerminalIds'] = terminalIds;
    map['SealIds'] = sealIds;
    map['WaterproofType'] = waterproofType;
    map['BlankId'] = blankId;
    return map;
  }

}