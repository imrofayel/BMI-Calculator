class Calculation {

  static String feedback(double bmi) {
    if (bmi < 16.0) {
      return 'Severe thinness';
    } else if (bmi <= 16.9) {
      return 'Moderate thinness';
    } else if (bmi <= 18.4) {
      return 'Mild thinness';
    } else if (bmi <= 24.9) {
      return 'Normal Range';
    } else if (bmi <= 29.9) {
      return 'Overweight Pre-obese';
    } else if (bmi <= 34.9) {
      return 'Obese - I';
    } else if (bmi <= 39.9) {
      return 'Obese - II';
    }
    return 'Obese - III';
  }

  static String getInterpretation(double bmi) {
    if (bmi < 16.0) {
      return 'Uh oh! Looks like you might be underweight.';
    } else if (bmi <= 16.9) {
      return 'You\'re on the cusp of being underweight.';
    } else if (bmi <= 18.4) {
      return 'You\'re at the low end of the normal BMI range.';
    } else if (bmi <= 24.9) {
      return 'You\'ve got a healthy BMI! Keep up the good work!';
    } else if (bmi <= 29.9) {
      return 'You\'re starting to inch into the overweight category.';
    } else if (bmi <= 34.9) {
      return 'You\'re in the obese category, but it\'s not too late to make changes. ';
    } else if (bmi <= 39.9) {
      return 'Talk to your doctor for a safe weight loss plan.';
    }
    return 'Mission Impossible bruh!';
  }
}