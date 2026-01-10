import 'package:valencia/user.dart';


class NutritionAlgorithm {
  int age;
  double weight;
  double height;
  ActivityLevel activityLevel;
  Sex sex;
  Mode mode;
 
  late final (double, double, double, double) _modeWeights = modeWeightsCalc(mode);
  late final double _activityMultiplier = activityLevelMultiplier(activityLevel);

  NutritionAlgorithm(User user):
    age = user.age,
    weight = user.weight,
    height = user.height,
    activityLevel = user.activityLevel,
    sex = user.sex,
    mode = user.mode;
  
  //calculate activity level multiplier
  double activityLevelMultiplier(ActivityLevel activityLevel){
    if (activityLevel == ActivityLevel.sedentary){
      return 1.2;
      }
    else if (activityLevel == ActivityLevel.lightlyActive){
       return 1.375;
    }
    else if (activityLevel == ActivityLevel.moderatelyActive){
      return 1.55;
    }
    else if (activityLevel == ActivityLevel.veryActive){
      return 1.725;
    }
    else if (activityLevel == ActivityLevel.extraActive){
      return 1.9;
    }
    else{
      return 1.0; //default value
    }
  }

  //weights for each mode
  (double, double, double, double) modeWeightsCalc(Mode mode) {
    double calWeights;
    double proteinWeights;
    double carbWeights;
    double fatWeights;

    if (mode == Mode.weightLoss){
      calWeights = .85;
      proteinWeights = 0.4;
      carbWeights = 0.3;
      fatWeights = 0.3;
    }
    else if (mode == Mode.weightGain){
      calWeights = 1.15;
      proteinWeights = 0.35;
      carbWeights = 0.4;
      fatWeights = 0.25;
    }
    else if (mode == Mode.recomposition){
      calWeights = 1;
      proteinWeights = 0.35;
      carbWeights = 0.4;
      fatWeights = 0.25; 
    }
    else if (mode == Mode.bulking){
      calWeights = 1.15;
      proteinWeights = 0.35;
      carbWeights = 0.4;
      fatWeights = 0.25; 
    }
    else if (mode == Mode.cutting){
      calWeights = 0.9;
      proteinWeights = 0.4;
      carbWeights = 0.4;
      fatWeights = 0.2;
    }
    else{ //default to maintenance
      calWeights = 1;
      proteinWeights = 0.3;
      carbWeights = 0.4;
      fatWeights = 0.3;
    }

    return (calWeights, proteinWeights, carbWeights, fatWeights);
  }

  int caloriesNeeded (int exerciseMinutes){
    num BMR;
    if (sex == Sex.female){
      BMR = 10 * weight + 6.25 * height - 5 * age - 161;
    }
    else{
      BMR = 10 * weight + 6.25 * height - 5 * age  + 5;
    }

    num caloriesBurnedFromExercise = exerciseMinutes / 30 * 200; //assuming 200 calories burned per 30 minutes of exercise

    return (BMR * _activityMultiplier * _modeWeights.$1 + caloriesBurnedFromExercise).toInt();
  } 

  num proteinNeeded (int exerciseMinutes){
    num proteinNeeded = caloriesNeeded(exerciseMinutes) * _modeWeights.$2 / 4; 
    return proteinNeeded;
  }

  num carbsNeeded (int exerciseMinutes){
    num carbsNeeded = caloriesNeeded(exerciseMinutes) * _modeWeights.$3 / 4; 
    return carbsNeeded;
  }

  num fatNeeded (int exerciseMinutes){
    num fatNeeded = caloriesNeeded(exerciseMinutes) * _modeWeights.$4 / 9; 
    return fatNeeded;
  }

  num waterNeeded (int exerciseMinutes){
    return (weight * 35 + (1080 + 240 * exerciseMinutes / 10)) / 1000; //ml to liters. 35ml per kg of body weight + 240ml per 10 minutes of exercise + 240ml for daily activities
  }
}