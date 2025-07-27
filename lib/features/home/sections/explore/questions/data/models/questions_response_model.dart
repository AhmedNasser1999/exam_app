import 'package:exam_app/features/home/sections/explore/questions/data/models/questions_dto.dart';
import 'package:exam_app/features/home/sections/explore/questions/domain/entities/questions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questions_response_model.g.dart';

@JsonSerializable()
class QuestionsResponseModel extends QuestionsEntity {
  String? message;
  List<QuestionsDto>? questions;

  QuestionsResponseModel({
    this.message,
    this.questions,
    required super.id,
    required super.question,
    required super.type,
    required super.correctAnswerKey,
    required super.answer,
    required super.key,
    required super.title,
    required super.duration,
    required super.subject,
    required super.numberOfQuestions,
    required super.active,
  });

  factory QuestionsResponseModel.fromJson(json) =>
      _$QuestionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseModelToJson(this);
}
