import 'package:gaz_mandob/Model/Product.dart';
import 'package:gaz_mandob/Model/Service.dart';
import 'package:gaz_mandob/Model/SubSupplier.dart';

class CartProduct {
  Services? service;
  SubSupplier? subSupplier;
  int? subSupplierid;
  Product? product;
  String? code;
  int? Quan;
  CartProduct(
      {this.Quan,
      this.product,
      this.service,
      this.code,
      this.subSupplier,
      this.subSupplierid});

  incrementproduct() {
    Quan = Quan! + 1;
  }

  dcrementproduct() {
    Quan = Quan! - 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id': service!.id,
      'supplier_id':
          subSupplier == null ? product!.supplierId : subSupplier!.supplierId,
      'quantity': Quan,
      'code': code,
      'product_id': product!.id,
    };
  }
}
