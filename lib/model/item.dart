class Item {
  double price;
  String imgPath;
  String location;
  String name;
  Item({required this.price,required this.imgPath, this.location = "Main branch", required this.name});
}

final List<Item> items = [
  Item(name:"product1" ,price: 12, imgPath: "images/f1.jpg", location: "Ali shop"),
  Item(name:"prodyct2" ,price: 33, imgPath: "images/f2.jpg"),
  Item(name:"prodyct3" ,price: 25, imgPath: "images/f3.jpg"),
  Item(name:"prodyct4" ,price: 13, imgPath: "images/f4.jpg"),
  Item(name:"prodyct5" ,price: 50, imgPath: "images/f5.jpg"),
  Item(name:"prodyct6" ,price: 70, imgPath: "images/f6.jpg"),
  Item(name:"prodyct7" ,price: 60, imgPath: "images/f7.jpg"),
  Item(name:"prodyct8" ,price: 19, imgPath: "images/f8.jpg"),

];