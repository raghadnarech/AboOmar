class Category {
  int? id;
  int? supplierId;
  String? name;
  String? image;

  Category({this.id, this.supplierId, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierId = json['supplier_id'];
    name = json['name'];
    image = json['image'];
  }
}
