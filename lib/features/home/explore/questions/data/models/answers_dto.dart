import 'package:json_annotation/json_annotation.dart';
part 'answers_dto.g.dart';

@JsonSerializable()
class AnswersDto {
  String? answer;
  String? key;

  AnswersDto({this.answer, this.key});

  factory AnswersDto.fromJson(json) => _$AnswersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersDtoToJson(this);
}
