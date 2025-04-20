class Services {
  int? id;
  String? name;

  Services({
    this.id,
    this.name,
  });

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
