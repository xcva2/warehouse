class FoodModel {
  String id;
  String name;
  String about;
  String price;
  String image;
  FoodModel({
    required this.id,
    required this.name,
    required this.about,
    required this.price,
    required this.image,
  });
  static FoodModel fromMap(Map<String, dynamic> map) {
    return FoodModel(
        id: map['id'],
        name: map['name'],
        about: map['about'],
        price: map['price'],
        image: map['image']);
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'about': about,
      'price': price,
      'image': image,
    };
  }

  Map<String, dynamic> toMapUpdate() {
    return {
      'name': name,
    };
  }
}
