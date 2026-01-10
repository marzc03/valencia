enum ActivityLevel {sedentary, lightlyActive, moderatelyActive, veryActive, extraActive}
enum Sex {male, female}
enum Mode {weightLoss, maintenance, weightGain, recomposition, bulking, cutting}

class User {
  int age;
  double weight; //in kg
  double height; //in cm
  ActivityLevel activityLevel; //sedentary, lightly active, moderately active, very active, extra active
  Sex sex;
  Mode mode;

    User({
    required this.age,
    required double w,
    required double h,
    required this.activityLevel,
    required this.sex,
    required this.mode,
    required String units
  }) : weight = units == "imperial" ? w * 0.453592 : w,
       height = units == "imperial" ? h * 2.54 : h;


}