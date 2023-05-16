import 'package:bolsista_tabuleiro_project/modules/game/domain/entities/designer_entity.dart';

class ArtistEntity extends DesignerEntity {
  ArtistEntity({
    required super.id,
    required super.name,
    required super.isImported,
    required super.isNational,
    required super.importSourceType,
    required super.country,
    required super.dateRegister,
  });
}
