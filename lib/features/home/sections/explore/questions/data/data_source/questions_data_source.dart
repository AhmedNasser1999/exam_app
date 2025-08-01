


import 'package:exam_app/features/home/sections/explore/questions/data/models/questions_response_model.dart';

abstract class QuestionsDataSource {
  Future<QuestionResponse> getAllQuestionsOnExam({
    required String examId,
    required String token,
  });
}
