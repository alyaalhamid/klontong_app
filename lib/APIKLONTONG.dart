class klontong {
  String? idstring;
  int? id;
  int? CategoryId;
  String? categoryName;
  String? sku;
  String? name;
  String? description;
  int? weight;
  int? width;
  int? length;
  int? height;
  String? image;
  int? harga;

  klontong(
      {this.idstring,
      this.id,
      this.CategoryId,
      this.categoryName,
      this.sku,
      this.name,
      this.description,
      this.weight,
      this.width,
      this.length,
      this.height,
      this.image,
      this.harga});

  factory klontong.fromJson(Map<String, dynamic> json) {
    return klontong(
        idstring: json['_id'].toString(),
        id: json['id'] != null ? json['id'] as int : null,
        CategoryId: json['CategoryId'],
        categoryName: json['categoryName'],
        sku: json['sku'],
        name: json['name'],
        description: json['description'],
        weight: json['weight'],
        width: json['width'],
        length: json['Length'],
        height: json['height'],
        image: json['image'],
        harga: json['harga']);
  }
}
