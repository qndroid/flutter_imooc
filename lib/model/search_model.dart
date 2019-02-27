import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  SearchModel();

  List<SearchItem> data;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class SearchItem {
  SearchItem();

  String key;
  String value;

  factory SearchItem.fromJson(Map<String, dynamic> json) =>
      _$SearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemToJson(this);
}
