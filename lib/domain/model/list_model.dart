class ListModel {
  int? surroundingBuildingId;
  int? distance;

  ListModel({this.surroundingBuildingId, this.distance});

  ListModel.fromJson(Map<String, dynamic> json) {
    surroundingBuildingId = json['SurroundingBuildingId'];
    distance = json['Distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SurroundingBuildingId'] = surroundingBuildingId;
    data['Distance'] = distance;
    return data;
  }
}
