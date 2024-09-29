class ActionItemModel {
  final String title;
  final String assetImagePath;
  final Function() onTab;
  const ActionItemModel(
      {required this.title, required this.assetImagePath, required this.onTab});
}
