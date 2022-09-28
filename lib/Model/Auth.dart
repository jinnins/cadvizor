class Auth {
  Auth({
      required this.id,
      required this.domain,
      required this.password,
      required this.name,
      required this.phone,
      required this.email,
      required this.role,
      required this.userGroupCd,
      required this.creationTime,
      required this.registeredDate,});

  Auth.fromJson(dynamic json) {
    id = json['_id'];
    domain = json['Domain'];
    password = json['Password'];
    name = json['Name'];
    phone = json['Phone'];
    email = json['Email'];
    role = json['Role'];
    userGroupCd = json['UserGroupCd'];
    creationTime = json['CreationTime'];
    registeredDate = json['RegisteredDate'];
  }
  late String id;
  late String domain;
  late String password;
  late String name;
  late String phone;
  late String email;
  late String role;
  late String userGroupCd;
  late dynamic creationTime;
  late String registeredDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['Domain'] = domain;
    map['Password'] = password;
    map['Name'] = name;
    map['Phone'] = phone;
    map['Email'] = email;
    map['Role'] = role;
    map['UserGroupCd'] = userGroupCd;
    map['CreationTime'] = creationTime;
    map['RegisteredDate'] = registeredDate;
    return map;
  }

}