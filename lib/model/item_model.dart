class Item {
  final int id;
  final String name;
  final num price;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
  return Item(
    id: parsedJson['id'],
    name: parsedJson.containsKey('category') ? parsedJson['category'] : parsedJson['name'],
    price: parsedJson['price'].round(),
    image: parsedJson['image'],
  );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['price'] = price;
    json['image'] = image;
    return json;
  }

  static List ItemList(List items) {
  List parsedItems = [];
  for (var i = 0; i < items.length; i++) {
    parsedItems.add(Item.fromJson(items[i]));
  }
  return parsedItems;
  }

  static void add(Item item) {}
}