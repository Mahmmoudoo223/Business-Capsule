class CategoriesModel {
  late String name, image, doctorname, price;
  CategoriesModel(
      {required this.name,
      required this.image,
      required this.doctorname,
      required this.price});

  CategoriesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    image = map["image"];
    doctorname = map["doctorname"];
    price = map["price"];
  }
  toJson() {
    return {
      "name": name,
      "image": image,
      "doctorname": doctorname,
      "price": price,
    };
  }
}
