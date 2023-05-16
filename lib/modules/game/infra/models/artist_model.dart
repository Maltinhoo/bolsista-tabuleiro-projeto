import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity {
  ArtistModel({
    required super.id,
    required super.name,
    required super.isImported,
    required super.isNational,
    required super.importSourceType,
    required super.country,
    required super.dateRegister,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
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
