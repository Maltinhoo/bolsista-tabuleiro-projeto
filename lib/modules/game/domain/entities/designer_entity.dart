class DesignerEntity {
  int id;
  String name;
  bool isImported;
  bool isNational;
  String importSourceType;
  String country;
  DateTime dateRegister;

  DesignerEntity({
    required this.id,
    required this.name,
    required this.isImported,
    required this.isNational,
    required this.importSourceType,
    required this.country,
    required this.dateRegister,
  });
}
