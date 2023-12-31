class ChoiceModel {
  ChoiceModel(
      {required this.name,
      this.onTap,
      required this.index,
      required this.isSelected});
  String name;
  Function? onTap;
  int index;
  bool isSelected;
}
