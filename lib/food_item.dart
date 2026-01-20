class FoodItem {
  String name;
  int calories;
  num protein;
  num fat;
  num carbs;

  FoodItem ({required this.name, required this.calories, required this.protein, required this.fat, required this.carbs});

  String getName() {
    return name;
  }

  int getCalories(){
    return calories;
  }

  num getProtein(){
    return protein;
  }

  num getFat(){
    return fat;
  }

  num getCarbs(){
    return carbs;
  }

  void setName(String name){
    this.name = name;
  }

  void setCalories(int calories){
    this.calories = calories;
  }

  void setProtein(num protein){
    this.protein = protein;
  }

  void setFat(num fat){
    this.fat = fat;
  }

  void setCarbs(num carbs){
    this.carbs = carbs;
  }
}