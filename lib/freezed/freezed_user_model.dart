import 'package:freezed_annotation/freezed_annotation.dart';

///code generator for dataclasses/unions ...etc, avoid boilerplates such as toJson fromJson, value equality, copywith, toString ...etc
/// after configuring the model like the we did below, run the builder by using the following command
/// flutter pub run build_runner build --delete-conflicting-outputs

part 'freezed_user_model.freezed.dart';
part 'freezed_user_model.g.dart';
///these two above files are generated on running the command

@freezed
class UserModel with _$UserModel{
    const factory UserModel({
    required String firstName,
    required String lastName,
    required String email,
    @Default(false) bool? isActive, //from freezed package, for passing default value to the constructor
}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

}