import 'package:json_annotation/json_annotation.dart';
part 'metadata_dto.g.dart';
@JsonSerializable()
class MetadataDto {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetadataDto({this.currentPage, this.numberOfPages, this.limit});

  factory MetadataDto.fromJson(json) => _$MetadataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataDtoToJson(this);
}
