// ignore_for_file: prefer_typing_uninitialized_variables

class DailyAccounts {
  int? count;
  List<Dailyaccount>? dailyaccount = [];
  var totalPrice;

  DailyAccounts({this.count, this.dailyaccount, this.totalPrice});

  DailyAccounts.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      dailyaccount = <Dailyaccount>[];
      json['data'].forEach((v) {
        dailyaccount!.add(Dailyaccount.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }
}

class Dailyaccount {
  int? id;
  int? orderId;
  var productId;
  int? supplierId;
  var code;
  String? status;
  var price;
  String? createdAt;
  String? updatedAt;
  int? serviceId;
  var quantity;
  var priceWithFees;
  int? nearestMan;
  List<Product>? product;
  String? number;

  Dailyaccount(
      {this.id,
      this.orderId,
      this.productId,
      this.supplierId,
      this.code,
      this.status,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.serviceId,
      this.quantity,
      this.priceWithFees,
      this.nearestMan,
      this.product,
      this.number});

  Dailyaccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    supplierId = json['supplier_id'];
    code = json['code'];
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
        product!.add(Product.fromJson(v));
      });
    }
    number = json['number'];
  }
}

class Product {
  String? name;
  int? quantity;
  var price;

  Product({this.name, this.quantity, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
  }
}
