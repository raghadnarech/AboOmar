class Orderes {
  int? id;
  int? userId;
  int? mandobId;
  String? paymentKind;
  String? status;
  String? toDoor;
  String? toHouse;
  String? isDiscount;
  var dateWanted;
  String? total;
  String? createdAt;
  String? updatedAt;
  String? number;
  var totalWithFees;
  int? addressId;
  int? isOnTime;
  String? cancelableUntil;
  var cancelReason;
  List<InvoicesInfo>? invoicesInfo;
  UserInfo? userInfo;
  Address? address;
  Mandob? mandob;

  Orderes(
      {this.id,
      this.userId,
      this.mandobId,
      this.paymentKind,
      this.status,
      this.toDoor,
      this.toHouse,
      this.isDiscount,
      this.dateWanted,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.number,
      this.totalWithFees,
      this.addressId,
      this.isOnTime,
      this.cancelableUntil,
      this.cancelReason,
      this.invoicesInfo,
      this.userInfo,
      this.address,
      this.mandob});

  Orderes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mandobId = json['mandob_id'];
    paymentKind = json['payment_kind'];
    status = json['status'];
    toDoor = json['toDoor'];
    toHouse = json['toHouse'];
    isDiscount = json['isDiscount'];
    dateWanted = json['date_wanted'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    number = json['number'];
    totalWithFees = json['total_with_fees'];
    addressId = json['address_id'];
    isOnTime = json['isOnTime'];
    cancelableUntil = json['cancelable_until'];
    cancelReason = json['cancel_reason'];
    if (json['invoices_info'] != null) {
      invoicesInfo = <InvoicesInfo>[];
      json['invoices_info'].forEach((v) {
        invoicesInfo!.add(new InvoicesInfo.fromJson(v));
      });
    }
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    mandob =
        json['mandob'] != null ? new Mandob.fromJson(json['mandob']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mandob_id'] = this.mandobId;
    data['payment_kind'] = this.paymentKind;
    data['status'] = this.status;
    data['toDoor'] = this.toDoor;
    data['toHouse'] = this.toHouse;
    data['isDiscount'] = this.isDiscount;
    data['date_wanted'] = this.dateWanted;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['number'] = this.number;
    data['total_with_fees'] = this.totalWithFees;
    data['address_id'] = this.addressId;
    data['isOnTime'] = this.isOnTime;
    data['cancelable_until'] = this.cancelableUntil;
    data['cancel_reason'] = this.cancelReason;
    if (this.invoicesInfo != null) {
      data['invoices_info'] =
          this.invoicesInfo!.map((v) => v.toJson()).toList();
    }
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.mandob != null) {
      data['mandob'] = this.mandob!.toJson();
    }
    return data;
  }
}

class InvoicesInfo {
  int? id;
  int? orderId;
  var productId;
  int? supplierId;
  var code;
  var managerId;
  String? status;
  var price;
  String? createdAt;
  String? updatedAt;
  int? serviceId;
  var quantity;
  var priceWithFees;
  var nearestMan;
  List<Product>? product;
  String? number;
  int? isCanceled;
  Supplier? supplier;

  InvoicesInfo(
      {this.id,
      this.orderId,
      this.productId,
      this.supplierId,
      this.code,
      this.managerId,
      this.status,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.serviceId,
      this.quantity,
      this.priceWithFees,
      this.nearestMan,
      this.product,
      this.number,
      this.isCanceled,
      this.supplier});

  InvoicesInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    supplierId = json['supplier_id'];
    code = json['code'];
    managerId = json['manager_id'];
    status = json['status'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceId = json['service_id'];
    quantity = json['quantity'];
    priceWithFees = json['price_with_fees'];
    nearestMan = json['nearest_man'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    number = json['number'];
    isCanceled = json['isCanceled'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['supplier_id'] = this.supplierId;
    data['code'] = this.code;
    data['manager_id'] = this.managerId;
    data['status'] = this.status;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['service_id'] = this.serviceId;
    data['quantity'] = this.quantity;
    data['price_with_fees'] = this.priceWithFees;
    data['nearest_man'] = this.nearestMan;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    data['isCanceled'] = this.isCanceled;
    if (this.supplier != null) {
      data['supplier'] = this.supplier!.toJson();
    }
    return data;
  }
}

class Product {
  int? productId;
  String? name;
  int? quantity;
  var price;

  Product({this.productId, this.name, this.quantity, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
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
  Service? service;
  User? user;

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
      this.updatedAt,
      this.service,
      this.user});

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
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['area'] = this.area;
    data['city'] = this.city;
    data['street'] = this.street;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  String? name;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Service({this.id, this.name, this.isActive, this.createdAt, this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['isActive'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isActive'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? userName;
  String? phone;
  String? email;
  var emailVerifiedAt;
  String? bankNum;
  var bankName;
  var logo;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? accountStatus;
  var supplierAddress;

  User(
      {this.id,
      this.userName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.bankNum,
      this.bankName,
      this.logo,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.accountStatus,
      this.supplierAddress});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    bankNum = json['bank_num'];
    bankName = json['bank_name'];
    logo = json['logo'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountStatus = json['account_status'];
    supplierAddress = json['supplier_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['bank_num'] = this.bankNum;
    data['bank_name'] = this.bankName;
    data['logo'] = this.logo;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_status'] = this.accountStatus;
    data['supplier_address'] = this.supplierAddress;
    return data;
  }
}

class UserInfo {
  int? id;
  String? userName;
  String? phone;
  String? email;
  var emailVerifiedAt;
  String? bankNum;
  String? bankName;
  String? logo;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? accountStatus;

  UserInfo(
      {this.id,
      this.userName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.bankNum,
      this.bankName,
      this.logo,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.accountStatus});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    bankNum = json['bank_num'];
    bankName = json['bank_name'];
    logo = json['logo'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountStatus = json['account_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['bank_num'] = this.bankNum;
    data['bank_name'] = this.bankName;
    data['logo'] = this.logo;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_status'] = this.accountStatus;
    return data;
  }
}

class Address {
  int? id;
  int? userId;
  String? name;
  var lang;
  var lat;
  String? kind;
  String? floor;
  int? isElevetor;
  String? createdAt;
  String? updatedAt;
  var distrectId;

  Address(
      {this.id,
      this.userId,
      this.name,
      this.lang,
      this.lat,
      this.kind,
      this.floor,
      this.isElevetor,
      this.createdAt,
      this.updatedAt,
      this.distrectId});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    lang = json['lang'];
    lat = json['lat'];
    kind = json['kind'];
    floor = json['floor'];
    isElevetor = json['isElevetor'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distrectId = json['distrect_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['kind'] = this.kind;
    data['floor'] = this.floor;
    data['isElevetor'] = this.isElevetor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['distrect_id'] = this.distrectId;
    return data;
  }
}

class Mandob {
  int? id;
  int? userId;
  var mandobManagerId;
  var code;
  String? personalImage;
  String? carImageFront;
  String? carImageBack;
  String? licenceImage;
  String? carLicence;
  String? idImage;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  String? lang;
  String? lat;
  UserMandob? user;

  Mandob(
      {this.id,
      this.userId,
      this.mandobManagerId,
      this.code,
      this.personalImage,
      this.carImageFront,
      this.carImageBack,
      this.licenceImage,
      this.carLicence,
      this.idImage,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.lang,
      this.lat,
      this.user});

  Mandob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mandobManagerId = json['mandob_manager_id'];
    code = json['code'];
    personalImage = json['personal_image'];
    carImageFront = json['car_image_front'];
    carImageBack = json['car_image_back'];
    licenceImage = json['licence_image'];
    carLicence = json['car_licence'];
    idImage = json['id_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    lang = json['lang'];
    lat = json['lat'];
    user = json['user'] != null ? UserMandob.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mandob_manager_id'] = this.mandobManagerId;
    data['code'] = this.code;
    data['personal_image'] = this.personalImage;
    data['car_image_front'] = this.carImageFront;
    data['car_image_back'] = this.carImageBack;
    data['licence_image'] = this.licenceImage;
    data['car_licence'] = this.carLicence;
    data['id_image'] = this.idImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserMandob {
  int? id;
  String? userName;
  String? phone;
  String? email;
  var emailVerifiedAt;
  String? bankNum;
  var bankName;
  var logo;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? accountStatus;

  UserMandob(
      {this.id,
      this.userName,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.bankNum,
      this.bankName,
      this.logo,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.accountStatus});

  UserMandob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    bankNum = json['bank_num'];
    bankName = json['bank_name'];
    logo = json['logo'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountStatus = json['account_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['bank_num'] = this.bankNum;
    data['bank_name'] = this.bankName;
    data['logo'] = this.logo;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_status'] = this.accountStatus;
    return data;
  }
}
