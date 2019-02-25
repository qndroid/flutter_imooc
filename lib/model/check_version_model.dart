import 'package:json_annotation/json_annotation.dart';

part 'check_version_model.g.dart';

@JsonSerializable()
class CheckVersionData {
  CheckVersionData();

  int code;
  int currentVersion;

  factory CheckVersionData.fromJson(Map<String, dynamic> json) =>
      _$CheckVersionDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckVersionDataToJson(this);
}
