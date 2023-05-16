import 'designer_entity.dart';

class PublishCompanyEntity extends DesignerEntity {
  PublishCompanyEntity({
    required super.id,
    required super.name,
    required super.isImported,
    required super.isNational,
    required super.importSourceType,
    required super.country,
    required super.dateRegister,
  });
}
