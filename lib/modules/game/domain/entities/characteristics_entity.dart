class CharacteristicsEntity {
  int id;
  String type;
  String description;
  bool isImported;
  String importSourceType;
  DateTime dateRegister;

  CharacteristicsEntity({
    required this.id,
    required this.type,
    required this.description,
    required this.isImported,
    required this.importSourceType,
    required this.dateRegister,
  });
}
