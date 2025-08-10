import 'package:exam_app/core/local_data/hive/result_exam_local.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/result/data/data_source/result_data_source_local.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResultDataSourceLocal)
class ResultDataSourceLocalImpl extends ResultDataSourceLocal {
  final ResultExamLocal resultExamLocal;

  ResultDataSourceLocalImpl({required this.resultExamLocal});
  @override
  Future<List<ExamInfoEntity>> getAllResultExam() async {
    return resultExamLocal.getExamResult();
  }
}
