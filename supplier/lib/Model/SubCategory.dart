class SubCategory {
  int? id;
  int? categoryId;
  String? name;
  String? image;

  SubCategory({this.id, this.categoryId, this.name, this.image});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
  }
}
