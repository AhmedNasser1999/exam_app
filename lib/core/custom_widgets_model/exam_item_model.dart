class ExamItemModel {
  final String title;
  final String time;
  final String numQuestion;
  final void Function()? onTap;

  ExamItemModel({
    required this.title,
    required this.time,
    required this.numQuestion,
    required this.onTap,
  });
}
