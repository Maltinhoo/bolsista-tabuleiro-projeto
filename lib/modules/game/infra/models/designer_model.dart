import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/designer_entity.dart';

class DesignerModel extends DesignerEntity {
  DesignerModel({
    required super.id,
    required super.name,
    required super.isImported,
    required super.isNational,
    required super.importSourceType,
    required super.country,
    required super.dateRegister,
  });

  factory DesignerModel.fromJson(Map<String, dynamic> json) {
    return DesignerModel(
      id: json['id'],
      name: json['nome'],
      isImported: json['importado'],
      isNational: json['nacional'],
      importSourceType: json['tipoFonteImportacao'],
      country: json['pais'] ?? '',
      dateRegister: DateTime.parse(json['dataCadastro']),
    );
  }
}
