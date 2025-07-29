import 'package:json_annotation/json_annotation.dart';
import 'exams_dto.dart';
import 'metadata_dto.dart';
part 'exams_response_model.g.dart';

@JsonSerializable()
class ExamResponse {
  final String message;
  final Metadata metadata;
  final List<Exam> exams;

  ExamResponse({
    required this.message,
    required this.metadata,
    required this.exams,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}
