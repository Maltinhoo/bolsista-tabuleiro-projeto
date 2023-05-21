import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/game_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/game/infra/models/artist_model.dart';
import 'package:bolsista_tabuleiro_project/modules/game/infra/models/characteristics_model.dart';
import 'package:bolsista_tabuleiro_project/modules/game/infra/models/designer_model.dart';
import 'package:bolsista_tabuleiro_project/modules/game/infra/models/publish_company_model.dart';

class GameModel extends GameEntity {
  GameModel({
    required super.id,
    required super.dateRegister,
    required super.isRPG,
    required super.name,
    required super.description,
    required super.minPlayers,
    required super.maxPlayers,
    required super.minAge,
    required super.year,
    required super.duration,
    required super.yearLaunchNational,
    required super.monthNationalLaunch,
    required super.avarageGrade,
    required super.image,
    required super.isExpansion,
    required super.isPrototype,
    required super.isImported,
    required super.importSourceType,
    required super.baseGameIds,
    required super.designers,
    required super.artists,
    required super.publishCompanies,
    required super.characteristics,
  });

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'],
      dateRegister: DateTime.parse(map['dataCadastro']),
      isRPG: map['rpg'],
      name: map['nome'],
      description: map['descricao'].toString().replaceAll('&#10;', ''),
      minPlayers: map['minimoJogadores'],
      maxPlayers: map['maximoJogadores'],
      minAge: map['idadeMinima'] ?? 0,
      year: map['ano'] ?? 0,
      duration: map['duracaoMedia'] ?? 0,
      yearLaunchNational: map['anoLancamentoNacional'] ?? 0,
      monthNationalLaunch: map['mesLancamentoNacional'] ?? 0,
      avarageGrade: map['notaMedia'] ?? 0,
      image: map['urlCapa'] ?? '',
      isExpansion: map['expansao'],
      isPrototype: map['prototipo'],
      isImported: map['importado'],
      importSourceType: map['tipoFonteImportacao'],
      baseGameIds: List<String>.from(map['idsJogosBase'].toString().split(',')),
      designers: List<DesignerModel>.from(
          map['designers'].map((x) => DesignerModel.fromJson(x))),
      artists: List<ArtistModel>.from(
          map['artistas'].map((x) => ArtistModel.fromJson(x))),
      publishCompanies: List<PublishCompanyModel>.from(
          map['editoras'].map((x) => PublishCompanyModel.fromJson(x))),
      characteristics: List<CharacteristicsModel>.from(
          map['caracteristicas'].map((x) => CharacteristicsModel.fromJson(x))),
    );
  }
}
