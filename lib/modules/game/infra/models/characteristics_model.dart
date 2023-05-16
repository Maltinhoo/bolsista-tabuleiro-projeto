import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/characteristics_entity.dart';

class CharacteristicsModel extends CharacteristicsEntity {
  CharacteristicsModel({
    required super.id,
    required super.type,
    required super.description,
    required super.isImported,
    required super.importSourceType,
    required super.dateRegister,
  });

  factory CharacteristicsModel.fromJson(Map<String, dynamic> json) {
    return CharacteristicsModel(
      id: json['id'],
      type: json['tipo'],
      description: json['descricao'],
      isImported: json['importado'],
      importSourceType: json['tipoFonteImportacao'],
      dateRegister: DateTime.parse(json['dataCadastro']),
    );
  }
}
