import 'package:json_annotation/json_annotation.dart';
part 'pet_type_button_model.g.dart';

@JsonSerializable()

/// ### Pet Type Button Model Class
/// This class uses for creating Searched pet for adoption.
///
class PetTypeButtonModel {
  String id;
  bool type;
  String imagePath;
  String name;

  PetTypeButtonModel(this.type, this.imagePath, this.name, this.id);

  Map<String, dynamic> toJson() => _$PetTypeButtonModelToJson(this);

  factory PetTypeButtonModel.fromJson(json) =>
      _$PetTypeButtonModelFromJson(json);
}
