import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/result/data/model/exam_info_model.dart';
import 'package:exam_app/features/home/sections/result/domain/repo/result_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllResultUseCase {
  final ResultRepo resultRepo;

  GetAllResultUseCase({required this.resultRepo});
  Future<Either<List<ExamInfoModel>, Failure>> call() async {
    return await resultRepo.getAllResult();
  }
}
