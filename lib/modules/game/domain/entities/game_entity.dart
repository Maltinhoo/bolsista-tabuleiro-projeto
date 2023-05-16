import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/artist_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/characteristics_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/designer_entity.dart';
import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/publish_company_entity.dart';

class GameEntity {
  int id;
  DateTime dateRegister;
  bool isRPG;
  String name;
  String description;
  int minPlayers;
  int maxPlayers;
  int minAge;
  int year;
  int duration;
  int yearLaunchNational;
  int monthNationalLaunch;
  double avarageGrade;
  String image;
  bool isExpansion;
  bool isPrototype;
  bool isImported;
  String importSourceType;
  List<String> baseGameIds;
  List<DesignerEntity> designers;
  List<ArtistEntity> artists;
  List<PublishCompanyEntity> publishCompanies;
  List<CharacteristicsEntity> characteristics;

  GameEntity({
    required this.id,
    required this.dateRegister,
    required this.isRPG,
    required this.name,
    required this.description,
    required this.minPlayers,
    required this.maxPlayers,
    required this.minAge,
    required this.year,
    required this.duration,
    required this.yearLaunchNational,
    required this.monthNationalLaunch,
    required this.avarageGrade,
    required this.image,
    required this.isExpansion,
    required this.isPrototype,
    required this.isImported,
    required this.importSourceType,
    required this.baseGameIds,
    required this.designers,
    required this.artists,
    required this.publishCompanies,
    required this.characteristics,
  });
}
