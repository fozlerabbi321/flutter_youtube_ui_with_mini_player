import 'package:flutter/cupertino.dart';

double valueFromPercentageInRange(
    {required final double min, max, percentage}) {
  return percentage * (max - min) + min;
}

double percentageFromValueInRange({required final double min, max, value}) {
  return (value - min) / (max - min);
}

double playerMaxHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}