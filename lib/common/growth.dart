String calcPercentageGrowth({required List dynamicsList}) {
  var lastElementOfList = dynamicsList[dynamicsList.length - 1];
  var preLastElementOfList = dynamicsList[dynamicsList.length - 2];

  double absoluteGrowth =
      (lastElementOfList.Cur_OfficialRate ?? lastElementOfList.Value) -
          (preLastElementOfList.Cur_OfficialRate ?? preLastElementOfList.Value);

  double percentageGrowth = absoluteGrowth *
      100 /
      (preLastElementOfList.Cur_OfficialRate ?? preLastElementOfList.Value);

  String plus = percentageGrowth > 0 ? '+' : '';

  return '$plus${percentageGrowth.toStringAsFixed(3)}%';
}
