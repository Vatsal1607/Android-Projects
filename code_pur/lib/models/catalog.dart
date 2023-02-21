import 'dart:convert';

class CatalogModel{

  //single tun
  // static final catModel = CatalogModel._internal();
  //
  // CatalogModel._internal();
  //
  // factory CatalogModel() => catModel;

  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image: "https://images.unsplash.com/photo-1611791485440-24e8239a0377?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aXBob25lJTIwMTIlMjBwcm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  ];
  // Get item by id:
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get item by position:
  Item getByPosition(int pos) => items[pos];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String, dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image
  };
}

