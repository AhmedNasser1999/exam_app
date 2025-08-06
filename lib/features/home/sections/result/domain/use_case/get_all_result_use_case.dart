import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failure.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/exam_info_entity.dart';
import 'package:exam_app/features/home/sections/result/domain/repo/result_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllResultUseCase {
  final ResultRepo resultRepo;

  GetAllResultUseCase({required this.resultRepo});
  Future<Either<List<ExamInfoEntity>, Failure>> call() async {
    return await resultRepo.getAllResult();
  }
}
