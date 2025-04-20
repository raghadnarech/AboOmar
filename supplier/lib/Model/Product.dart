// ignore_for_file: prefer_typing_uninitialized_variables

class Product {
  var id;
  var categoryId;
  var supplierId;
  var subCategoryId;
  var isOffer;
  var isActive;
  String? name;
  var price;
  var isDiscount;
  dynamic discountCode;
  dynamic timeFrom;
  dynamic timeTo;
  dynamic image;
  dynamic code_value;
  dynamic offerText;
  dynamic offerValueKind;
  dynamic offerValue;
  dynamic offerStatus;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.categoryId,
      this.supplierId,
      this.subCategoryId,
      this.isOffer,
      this.isActive,
      this.name,
      this.isDiscount,
      this.price,
      this.discountCode,
      this.timeFrom,
      this.timeTo,
      this.image,
      this.offerText,
      this.offerValueKind,
      this.offerValue,
      this.code_value,
      this.offerStatus,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    categoryId = json['category_id'] ?? '';
    supplierId = json['supplier_id'] ?? '';
    subCategoryId = json['sub_category_id'] ?? '';
    isOffer = json['isOffer'] ?? '';
    isActive = json['isActive'] ?? '';
    name = json['name'] ?? '';
    isDiscount = json['isDiscount'] ?? 0;
    code_value = json['code_value'] ?? '';

    price = json['price'] ?? 0;
    discountCode = json['discount_code'] ?? '';
    timeFrom = json['time_from'] ?? '';
    timeTo = json['time_to'] ?? '';
    image = json['image'] ?? '';
    offerText = json['offer_text'] ?? '';
    offerValueKind = json['offer_value_kind'] ?? '';
    offerValue = json['offer_value'] ?? '';
    offerStatus = json['offer_status'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }
}
