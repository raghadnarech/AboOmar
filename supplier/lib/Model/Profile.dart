class Profile {
  int? id;
  String? userName;
  String? phone;
  String? email;
  String? bankNum;
  String? bankName;
  String? logo;
  String? role;
  Supplier? supplier;

  Profile({
    this.id,
    this.userName,
    this.phone,
    this.email,
    this.bankNum,
    this.bankName,
    this.logo,
    this.role,
    this.supplier,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    bankNum = json['bank_num'];
    bankName = json['bank_name'];
    logo = json['logo'];
    role = json['role'];
    supplier =
        json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
  }
}

class Supplier {
  int? id;
  int? userId;
  int? serviceId;
  String? lang;
  String? lat;
  String? area;
  String? city;
  String? street;
  String? createdAt;
  String? updatedAt;

  Supplier(
      {this.id,
      this.userId,
      this.serviceId,
      this.lang,
      this.lat,
      this.area,
      this.city,
      this.street,
      this.createdAt,
      this.updatedAt});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    lang = json['lang'];
    lat = json['lat'];
    area = json['area'];
    city = json['city'];
    street = json['street'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
