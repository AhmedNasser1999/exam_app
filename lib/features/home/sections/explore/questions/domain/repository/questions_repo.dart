import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/data/models/result_model/exam_submit_request_model.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/result_entity.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';

abstract class QuestionsRepo {
  Future<Either<List<QuestionsEntity>, Failure>> getAllQuestionsOnExam({
    required String examId,
  });
  Future<Either<ResultEntity, Failure>> checkQuestionsOnExam({
    required ExamSubmitRequestModel question,
  });
  Future<Either<void, Failure>> saveExamResult({
    required ExamInfoModel examInfo,
  });
  Future<String> getToken({required String tokenKey});
}
