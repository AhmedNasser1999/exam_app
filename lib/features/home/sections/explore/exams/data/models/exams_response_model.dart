import 'package:exam_app/features/home/sections/explore/exams/domain/entities/exam_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'exams_dto.dart';
import 'metadata_dto.dart';
part 'exams_response_model.g.dart';
@JsonSerializable()
class ExamsResponseModel extends ExamEntity {
  String? message;
  MetadataDto? metadata;
  List<ExamsDto>? exams;

  ExamsResponseModel({
    this.message,
    this.metadata,
    this.exams,
    required super.id,
    required super.title,
    required super.duration,
    required super.subjectId,
    required super.numberOfQuestions,
    required super.isActive,
    required super.createdAt,
  });

  factory ExamsResponseModel.fromJson(json) =>
      _$ExamsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseModelToJson(this);
}
