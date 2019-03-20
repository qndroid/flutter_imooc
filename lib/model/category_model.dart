import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel();

  String defaultId;
  List<MainCategoryItem> mainCategoryItems;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class MainCategoryItem {
  MainCategoryItem();

  String cateId;
  String cateName;

  List<SubCategoryGroup> subCategoryGroups;

  factory MainCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$MainCategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$MainCategoryItemToJson(this);
}

@JsonSerializable()
class SubCategoryGroup {
  SubCategoryGroup();

  String cateGroupName;
  List<SubCategoryItem> cateList;

  factory SubCategoryGroup.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryGroupFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryGroupToJson(this);
}

@JsonSerializable()
class SubCategoryItem {
  SubCategoryItem();

  String cateId;
  String cateTitle;
  String cateUrl;

  factory SubCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryItemToJson(this);
}
