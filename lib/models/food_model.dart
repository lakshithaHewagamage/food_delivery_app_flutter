class FoodModel{
  late final String name;
  final double price;
  final double weight;
  final double calory;
  final double protein;
  final String item;
  final String imgPath;

  FoodModel(
    {
      required this.name,
      required this.price,
      required this.weight,
      required this.calory,
      required this.protein,
      required this.item,
      required this.imgPath
    }
  );

  static List<FoodModel> list = [
    FoodModel(
      name: "Tacos Nanchas Choco",
      price: 120,
      weight: 130,
      calory: 460,
      protein: 30,
      item: "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Choleslaw Salad #Healthy Yolk",
      imgPath: "1.png",
    ),
    FoodModel(
      name: "Porata Masala",
      price: 100,
      weight: 120,
      calory: 300,
      protein: 45,
      item: "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Choleslaw Salad #Healthy Yolk",
      imgPath: "2.png",
    ),
    FoodModel(
      name: "Taco Kebab",
      price: 120,
      weight: 130,
      calory: 460,
      protein: 30,
      item: "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Choleslaw Salad #Healthy Yolk",
      imgPath: "3.png",
    ),
    FoodModel(
      name: "Chicken Salad",
      price: 120,
      weight: 130,
      calory: 460,
      protein: 30,
      item: "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Choleslaw Salad #Healthy Yolk",
      imgPath: "4.png",
    ),
    FoodModel(
      name: "Chicken Eggs",
      price: 120,
      weight: 130,
      calory: 460,
      protein: 30,
      item: "#Chicken #Juicy BBQ #Vegetables #Potato Wedges #Choleslaw Salad #Healthy Yolk",
      imgPath: "5.png",
    ),
  ];
}

