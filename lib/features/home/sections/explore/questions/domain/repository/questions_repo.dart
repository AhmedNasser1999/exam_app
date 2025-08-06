import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';

abstract class QuestionsRepo {
  Future<Either<List<QuestionsEntity>, Failure>> getAllQuestionsOnExam({
    required String examId,
  });
  Future<Either<ResultEntity, Failure>> checkQuestionsOnExam({
    required ExamSubmitRequestModel question,
  });
  Future<Either<void, Failure>> saveExamResult({
    required ExamInfoEntity examInfo,
  });
  Future<String> getToken({required String tokenKey});
}
