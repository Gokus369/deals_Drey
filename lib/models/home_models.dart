List<Category> category = [
  Category(
      catgryNme: 'Mobile',
      imageUrl:
          'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?q=80&w=967&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Category(
      catgryNme: 'LapTop',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1671247953201-2fdc17af6692?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  Category(
      catgryNme: 'Camera',
      imageUrl:
          'https://media.istockphoto.com/id/185278433/photo/black-digital-slr-camera-in-a-white-background.jpg?s=2048x2048&w=is&k=20&c=0ke2jY9H9yKxz6Z_c29rOaTmwpuZXYtvOxQ5U8bS0Ds='),
  Category(
      catgryNme: 'LED',
      imageUrl:
          'https://media.istockphoto.com/id/607653434/photo/hand-holding-led-bulb-with-lighting-on-blue-sky-background.jpg?s=2048x2048&w=is&k=20&c=pvfjK1p5YUte-Hsz0Bwiz9PRPxKYL3PzxIBgqEu_n0M='),
];
List<FoodTrending> foodTrendings = [
  FoodTrending(
      name: 'Samsung',
      review: '500 Reviews',
      calories: '100-300 calories',
      price: '\$12',
      imageUrl: "assets/images/prd.png"),
  FoodTrending(
      name: 'Iphone',
      review: '500 Reviews',
      calories: '100-300 calories',
      price: '\$50',
      imageUrl: "assets/images/prd.png"),
  FoodTrending(
      name: 'Redmi',
      review: '500 Reviews',
      calories: '100-300 calories',
      price: '\$22',
      imageUrl: "assets/images/prd.png"),
  FoodTrending(
      name: 'Oneplus',
      review: '500 Reviews',
      calories: '100-300 calories',
      price: '\$30',
      imageUrl: "assets/images/prd.png")
];

class FoodTrending {
  String? name;
  String? review;
  String? calories;
  String? price;
  String? imageUrl;

  FoodTrending(
      {this.name, this.review, this.calories, this.price, this.imageUrl});

  FoodTrending.fromJson(Map<String, dynamic> json) {
    name = json['foodName'];
    review = json['review'];
    calories = json['calories'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodName'] = name;
    data['review'] = review;
    data['calories'] = calories;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

class Category {
  String? catgryNme;
  String? imageUrl;

  Category({this.catgryNme, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    catgryNme = json['catgryNme'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['catgryNme'] = catgryNme;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
