// ignore_for_file: prefer_typing_uninitialized_variables

class Invoice {
  int? supplierId;
  int? orderId;
  int? invoice_id;
  var code;
  var invoiceStatus;
  int? serviceId;
  int? priceWithFeesForGaz;
  var invoiceNumber;
  List<ProductFromInvoices>? product;
  var orderPayKind;
  var orderStatus;
  var toTheDoor;
  var toTheHouse;
  var toTheDiscount;
  var isDate;
  var totalPriceForOrder;
  var totalOrderPriceWithFees;
  var orderDate;
  var orderNumber;
  var userName;
  int? userId;
  var userPhone;
  var userAddress;

  Invoice(
      {this.supplierId,
      this.orderId,
      this.code,
      this.invoiceStatus,
      this.serviceId,
      this.priceWithFeesForGaz,
      this.invoiceNumber,
      this.product,
      this.orderPayKind,
      this.orderStatus,
      this.toTheDoor,
      this.toTheHouse,
      this.toTheDiscount,
      this.isDate,
      this.totalPriceForOrder,
      this.totalOrderPriceWithFees,
      this.orderDate,
      this.orderNumber,
      this.userName,
      this.userId,
      this.userPhone,
      this.userAddress});

  Invoice.fromJson(Map<String, dynamic> json) {
    supplierId = json['supplier_id'];
    orderId = json['order_id'];
    invoice_id = json['invoice_id'];
    code = json['code'];
    invoiceStatus = json['invoice_status'];
    serviceId = json['service_id'];
    priceWithFeesForGaz = json['price_with_fees_forGaz'];
    invoiceNumber = json['invoice_number'];
    if (json['product'] != null) {
      product = <ProductFromInvoices>[];
      json['product'].forEach((v) {
        product!.add(ProductFromInvoices.fromJson(v));
      });
    }
    orderPayKind = json['order_pay_kind'];
    orderStatus = json['order_status'];
    toTheDoor = json['to_the_door'];
    toTheHouse = json['to_the_House'];
    toTheDiscount = json['to_the_Discount'];
    isDate = json['is_date'];
    totalPriceForOrder = json['total_price_for_order'];
    totalOrderPriceWithFees = json['total_order_price_withFees'];
    orderDate = json['order_date'];
    orderNumber = json['order_number'];
    userName = json['user_name'];
    userId = json['user_id'];
    userPhone = json['user_phone'];
    userAddress = json['user_address'];
  }
}

class ProductFromInvoices {
  String? name;
  int? quantity;
  var price;

  ProductFromInvoices({this.name, this.quantity, this.price});

  ProductFromInvoices.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
  }
}
