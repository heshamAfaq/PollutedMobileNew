class ResponsibleAuthoritiesModel {
  int? id;
  String? name;
  String? description;

  ResponsibleAuthoritiesModel({this.id, this.name, this.description});

  factory ResponsibleAuthoritiesModel.fromJson(Map<String, dynamic> json) {
    return ResponsibleAuthoritiesModel(
        name: json["name"], id: json["id"], description: json["description"]);
  }
}
