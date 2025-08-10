class ExamItemModel {
  final String title;
  final String time;
  final String numQuestion;
  final String examInfo;

  final void Function()? onTap;

  ExamItemModel({
    required this.title,
    required this.time,
    required this.examInfo,
    required this.numQuestion,
    required this.onTap,
  });
}
