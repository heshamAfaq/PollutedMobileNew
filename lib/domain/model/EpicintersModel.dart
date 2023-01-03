class EpicintersModel {
  EpicintersModel({
    this.epicenters,
    this.count,
  });

  EpicintersModel.fromJson(dynamic json) {
    if (json['epicenters'] != null) {
      epicenters = [];
      json['epicenters'].forEach((v) {
        epicenters?.add(Epicenters.fromJson(v));
      });
    }
    count = json['count'];
  }

  List<Epicenters>? epicenters;
  String? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (epicenters != null) {
      map['epicenters'] = epicenters?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    return map;
  }
}

class Epicenters {
  Epicenters({
    this.id,
    this.description,
    this.reason,
    this.size,
    this.lat,
    this.long,
    this.creationDate,
    this.status,
    this.statusReason,
    this.setStatusPerson,
    this.cityId,
    this.city,
    this.reportId,
    this.report,
    this.epicenterPhotos,
    this.epicenterPolluationSources,
  });

  Epicenters.fromJson(dynamic json) {
    id = json['id'];
    description = json['description'];
    reason = json['reason'];
    size = json['size'];
    lat = json['lat'];
    long = json['long'];
    creationDate = json['creationDate'];
    status = json['status'];
    statusReason = json['statusReason'];
    setStatusPerson = json['setStatusPerson'];
    cityId = json['cityId'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    reportId = json['reportId'];
    report = json['report'] != null ? Report.fromJson(json['report']) : null;
    if (json['epicenterPhotos'] != null) {
      epicenterPhotos = [];
      json['epicenterPhotos'].forEach((v) {
        epicenterPhotos?.add(EpicenterPhotos.fromJson(v));
      });
    }
    if (json['epicenterPolluationSources'] != null) {
      epicenterPolluationSources = [];
      json['epicenterPolluationSources'].forEach((v) {
        epicenterPolluationSources?.add(EpicenterPolluationSources.fromJson(v));
      });
    }
  }

  int? id;
  String? description;
  String? reason;
  double? size;
  double? lat;
  double? long;
  String? creationDate;
  int? status;
  dynamic statusReason;
  String? setStatusPerson;
  int? cityId;
  City? city;
  int? reportId;
  Report? report;
  List<EpicenterPhotos>? epicenterPhotos;
  List<EpicenterPolluationSources>? epicenterPolluationSources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['description'] = description;
    map['reason'] = reason;
    map['size'] = size;
    map['lat'] = lat;
    map['long'] = long;
    map['creationDate'] = creationDate;
    map['status'] = status;
    map['statusReason'] = statusReason;
    map['setStatusPerson'] = setStatusPerson;
    map['cityId'] = cityId;
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['reportId'] = reportId;
    if (report != null) {
      map['report'] = report?.toJson();
    }
    if (epicenterPhotos != null) {
      map['epicenterPhotos'] = epicenterPhotos?.map((v) => v.toJson()).toList();
    }
    if (epicenterPolluationSources != null) {
      map['epicenterPolluationSources'] =
          epicenterPolluationSources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class EpicenterPolluationSources {
  EpicenterPolluationSources({
    this.epicenterId,
    this.polluationSourceId,
    this.polluationSource,
  });

  EpicenterPolluationSources.fromJson(dynamic json) {
    epicenterId = json['epicenterId'];
    polluationSourceId = json['polluationSourceId'];
    polluationSource = json['polluationSource'] != null
        ? PolluationSource.fromJson(json['polluationSource'])
        : null;
  }

  int? epicenterId;
  int? polluationSourceId;
  PolluationSource? polluationSource;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['epicenterId'] = epicenterId;
    map['polluationSourceId'] = polluationSourceId;
    if (polluationSource != null) {
      map['polluationSource'] = polluationSource?.toJson();
    }
    return map;
  }
}

class PolluationSource {
  PolluationSource({
    this.id,
    this.name,
    this.nameEnglish,
  });

  PolluationSource.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}

class EpicenterPhotos {
  EpicenterPhotos({
    this.id,
    this.photo,
    this.epicenterId,
  });

  EpicenterPhotos.fromJson(dynamic json) {
    id = json['id'];
    photo = json['photo'];
    epicenterId = json['epicenterId'];
  }

  int? id;
  String? photo;
  int? epicenterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photo'] = photo;
    map['epicenterId'] = epicenterId;
    return map;
  }
}

class Report {
  Report({
    this.id,
    this.extentOfPolluationDescription,
    this.lat,
    this.long,
    this.hasResidentialArea,
    this.hasVegetation,
    this.hasGroundWater,
    this.epicenterId,
    this.temperature,
    this.salinity,
    this.totalDissolvedSolids,
    this.totalSuspendedSolids,
    this.ph,
    this.turbidity,
    this.electricalConnection,
    this.dissolvedOxygen,
    this.totalOrganicCarbon,
    this.volatileOrganicMatter,
    this.ozone,
    this.allKindsOfCarbon,
    this.nitrogenDioxide,
    this.sulfurDioxide,
    this.pM25,
    this.pM10,
    this.averageOfRiskFactor,
    this.evaluationRisk,
    this.hardness,
    this.totalOfWaterIndicator,
    this.totalOfAirIndicator,
    this.totalOfZoneIndicator,
    this.totalPollutionIndicatorRelatedEpicenters,
    this.humidity,
    this.windSpeed,
    this.sunRise,
    this.epicenterLenght,
    this.epicenterWidth,
    this.epicenterDepth,
    this.cityId,
    this.city,
    this.landFormId,
    this.landForm,
    this.pollutantPlaceId,
    this.pollutantPlace,
    this.surfaceWaterId,
    this.surfaceWater,
    this.responsibleAuthority,
    this.natureOfEpicenter,
    this.windDirection,
    this.reportPhotos,
    this.reportPolluationSources,
    this.reportPotentialPollutants,
    this.reportSurroundingBuildings,
    this.reportIndustrialActivities,
    this.reportSemanticPollutions,
    this.reportSurroundedMediums,
    this.reportPlants,
    this.reportUndergroundWaters,
  });

  Report.fromJson(dynamic json) {
    id = json['id'];
    extentOfPolluationDescription = json['extentOfPolluationDescription'];
    lat = json['lat'];
    long = json['long'];
    hasResidentialArea = json['hasResidentialArea'];
    hasVegetation = json['hasVegetation'];
    hasGroundWater = json['hasGroundWater'];
    epicenterId = json['epicenterId'];
    temperature = json['temperature'];
    salinity = json['salinity'];
    totalDissolvedSolids = json['totalDissolvedSolids'];
    totalSuspendedSolids = json['totalSuspendedSolids'];
    ph = json['ph'];
    turbidity = json['turbidity'];
    electricalConnection = json['electricalConnection'];
    dissolvedOxygen = json['dissolvedOxygen'];
    totalOrganicCarbon = json['totalOrganicCarbon'];
    volatileOrganicMatter = json['volatileOrganicMatter'];
    ozone = json['ozone'];
    allKindsOfCarbon = json['allKindsOfCarbon'];
    nitrogenDioxide = json['nitrogenDioxide'];
    sulfurDioxide = json['sulfurDioxide'];
    pM25 = json['pM25'];
    pM10 = json['pM10'];
    averageOfRiskFactor = json['averageOfRiskFactor'];
    evaluationRisk = json['evaluationRisk'];
    hardness = json['hardness'];
    totalOfWaterIndicator = json['totalOfWaterIndicator'];
    totalOfAirIndicator = json['totalOfAirIndicator'];
    totalOfZoneIndicator = json['totalOfZoneIndicator'];
    totalPollutionIndicatorRelatedEpicenters =
        json['totalPollutionIndicatorRelatedEpicenters'];
    humidity = json['humidity'];
    windSpeed = json['windSpeed'];
    sunRise = json['sunRise'];
    epicenterLenght = json['epicenterLenght'];
    epicenterWidth = json['epicenterWidth'];
    epicenterDepth = json['epicenterDepth'];
    cityId = json['cityId'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    landFormId = json['landFormId'];
    landForm =
        json['landForm'] != null ? LandForm.fromJson(json['landForm']) : null;
    pollutantPlaceId = json['pollutantPlaceId'];
    pollutantPlace = json['pollutantPlace'] != null
        ? PollutantPlace.fromJson(json['pollutantPlace'])
        : null;
    surfaceWaterId = json['surfaceWaterId'];
    surfaceWater = json['surfaceWater'] != null
        ? SurfaceWater.fromJson(json['surfaceWater'])
        : null;
    responsibleAuthority = json['responsibleAuthority'] != null
        ? ResponsibleAuthority.fromJson(json['responsibleAuthority'])
        : null;
    natureOfEpicenter = json['natureOfEpicenter'];
    windDirection = json['windDirection'];
    if (json['reportPhotos'] != null) {
      reportPhotos = [];
      json['reportPhotos'].forEach((v) {
        reportPhotos?.add(ReportPhotos.fromJson(v));
      });
    }
    if (json['reportPolluationSources'] != null) {
      reportPolluationSources = [];
      json['reportPolluationSources'] = reportPolluationSources;
    }
    if (json['reportPotentialPollutants'] != null) {
      reportPotentialPollutants = [];
      json['reportPotentialPollutants'].forEach((v) {
        reportPotentialPollutants?.add(ReportPotentialPollutants.fromJson(v));
      });
    }
    if (json['reportSurroundingBuildings'] != null) {
      reportSurroundingBuildings = [];
      json['reportSurroundingBuildings'].forEach((v) {
        reportSurroundingBuildings?.add(ReportSurroundingBuildings.fromJson(v));
      });
    }
    if (json['reportIndustrialActivities'] != null) {
      reportIndustrialActivities = [];
      json['reportIndustrialActivities']=
        reportIndustrialActivities;
    }
    if (json['reportSemanticPollutions'] != null) {
      reportSemanticPollutions = [];
      json['reportSemanticPollutions']=
        reportSemanticPollutions;
    }
    if (json['reportSurroundedMediums'] != null) {
      reportSurroundedMediums = [];
      json['reportSurroundedMediums']=
        reportSurroundedMediums;
    }
    if (json['reportPlants'] != null) {
      reportPlants = [];
      json['reportPlants']=
        reportPlants;
    }
    if (json['reportUndergroundWaters'] != null) {
      reportUndergroundWaters = [];
      json['reportUndergroundWaters']=
        reportUndergroundWaters;
    }
  }

  int? id;
  String? extentOfPolluationDescription;
  double? lat;
  double? long;
  bool? hasResidentialArea;
  bool? hasVegetation;
  bool? hasGroundWater;
  int? epicenterId;
  double? temperature;
  double? salinity;
  double? totalDissolvedSolids;
  double? totalSuspendedSolids;
  double? ph;
  double? turbidity;
  double? electricalConnection;
  double? dissolvedOxygen;
  double? totalOrganicCarbon;
  double? volatileOrganicMatter;
  double? ozone;
  double? allKindsOfCarbon;
  double? nitrogenDioxide;
  double? sulfurDioxide;
  double? pM25;
  double? pM10;
  double? averageOfRiskFactor;
  String? evaluationRisk;
  double? hardness;
  double? totalOfWaterIndicator;
  double? totalOfAirIndicator;
  double? totalOfZoneIndicator;
  double? totalPollutionIndicatorRelatedEpicenters;
  double? humidity;
  dynamic windSpeed;
  bool? sunRise;
  double? epicenterLenght;
  double? epicenterWidth;
  double? epicenterDepth;
  int? cityId;
  City? city;
  int? landFormId;
  LandForm? landForm;
  int? pollutantPlaceId;
  PollutantPlace? pollutantPlace;
  int? surfaceWaterId;
  SurfaceWater? surfaceWater;
  ResponsibleAuthority? responsibleAuthority;
  dynamic natureOfEpicenter;
  dynamic windDirection;
  List<ReportPhotos>? reportPhotos;
  List<dynamic>? reportPolluationSources;
  List<ReportPotentialPollutants>? reportPotentialPollutants;
  List<ReportSurroundingBuildings>? reportSurroundingBuildings;
  List<dynamic>? reportIndustrialActivities;
  List<dynamic>? reportSemanticPollutions;
  List<dynamic>? reportSurroundedMediums;
  List<dynamic>? reportPlants;
  List<dynamic>? reportUndergroundWaters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['extentOfPolluationDescription'] = extentOfPolluationDescription;
    map['lat'] = lat;
    map['long'] = long;
    map['hasResidentialArea'] = hasResidentialArea;
    map['hasVegetation'] = hasVegetation;
    map['hasGroundWater'] = hasGroundWater;
    map['epicenterId'] = epicenterId;
    map['temperature'] = temperature;
    map['salinity'] = salinity;
    map['totalDissolvedSolids'] = totalDissolvedSolids;
    map['totalSuspendedSolids'] = totalSuspendedSolids;
    map['ph'] = ph;
    map['turbidity'] = turbidity;
    map['electricalConnection'] = electricalConnection;
    map['dissolvedOxygen'] = dissolvedOxygen;
    map['totalOrganicCarbon'] = totalOrganicCarbon;
    map['volatileOrganicMatter'] = volatileOrganicMatter;
    map['ozone'] = ozone;
    map['allKindsOfCarbon'] = allKindsOfCarbon;
    map['nitrogenDioxide'] = nitrogenDioxide;
    map['sulfurDioxide'] = sulfurDioxide;
    map['pM25'] = pM25;
    map['pM10'] = pM10;
    map['averageOfRiskFactor'] = averageOfRiskFactor;
    map['evaluationRisk'] = evaluationRisk;
    map['hardness'] = hardness;
    map['totalOfWaterIndicator'] = totalOfWaterIndicator;
    map['totalOfAirIndicator'] = totalOfAirIndicator;
    map['totalOfZoneIndicator'] = totalOfZoneIndicator;
    map['totalPollutionIndicatorRelatedEpicenters'] =
        totalPollutionIndicatorRelatedEpicenters;
    map['humidity'] = humidity;
    map['windSpeed'] = windSpeed;
    map['sunRise'] = sunRise;
    map['epicenterLenght'] = epicenterLenght;
    map['epicenterWidth'] = epicenterWidth;
    map['epicenterDepth'] = epicenterDepth;
    map['cityId'] = cityId;
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['landFormId'] = landFormId;
    if (landForm != null) {
      map['landForm'] = landForm?.toJson();
    }
    map['pollutantPlaceId'] = pollutantPlaceId;
    if (pollutantPlace != null) {
      map['pollutantPlace'] = pollutantPlace?.toJson();
    }
    map['surfaceWaterId'] = surfaceWaterId;
    if (surfaceWater != null) {
      map['surfaceWater'] = surfaceWater?.toJson();
    }
    if (responsibleAuthority != null) {
      map['responsibleAuthority'] = responsibleAuthority?.toJson();
    }
    map['natureOfEpicenter'] = natureOfEpicenter;
    map['windDirection'] = windDirection;
    if (reportPhotos != null) {
      map['reportPhotos'] = reportPhotos?.map((v) => v.toJson()).toList();
    }
    if (reportPolluationSources != null) {
      map['reportPolluationSources'] =
          reportPolluationSources?.map((v) => v.toJson()).toList();
    }
    if (reportPotentialPollutants != null) {
      map['reportPotentialPollutants'] =
          reportPotentialPollutants?.map((v) => v.toJson()).toList();
    }
    if (reportSurroundingBuildings != null) {
      map['reportSurroundingBuildings'] =
          reportSurroundingBuildings?.map((v) => v.toJson()).toList();
    }
    if (reportIndustrialActivities != null) {
      map['reportIndustrialActivities'] =
          reportIndustrialActivities?.map((v) => v.toJson()).toList();
    }
    if (reportSemanticPollutions != null) {
      map['reportSemanticPollutions'] =
          reportSemanticPollutions?.map((v) => v.toJson()).toList();
    }
    if (reportSurroundedMediums != null) {
      map['reportSurroundedMediums'] =
          reportSurroundedMediums?.map((v) => v.toJson()).toList();
    }
    if (reportPlants != null) {
      map['reportPlants'] = reportPlants?.map((v) => v.toJson()).toList();
    }
    if (reportUndergroundWaters != null) {
      map['reportUndergroundWaters'] =
          reportUndergroundWaters?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ReportSurroundingBuildings {
  ReportSurroundingBuildings({
    this.reportId,
    this.surroundingBuildingId,
    this.surroundingBuilding,
    this.distance,
  });

  ReportSurroundingBuildings.fromJson(dynamic json) {
    reportId = json['reportId'];
    surroundingBuildingId = json['surroundingBuildingId'];
    surroundingBuilding = json['surroundingBuilding'] != null
        ? SurroundingBuilding.fromJson(json['surroundingBuilding'])
        : null;
    distance = json['distance'];
  }

  int? reportId;
  int? surroundingBuildingId;
  SurroundingBuilding? surroundingBuilding;
  double? distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reportId'] = reportId;
    map['surroundingBuildingId'] = surroundingBuildingId;
    if (surroundingBuilding != null) {
      map['surroundingBuilding'] = surroundingBuilding?.toJson();
    }
    map['distance'] = distance;
    return map;
  }
}

class SurroundingBuilding {
  SurroundingBuilding({
    this.id,
    this.name,
    this.nameEnglish,
  });

  SurroundingBuilding.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}

class ReportPotentialPollutants {
  ReportPotentialPollutants({
    this.reportId,
    this.potentialPollutantId,
    this.potentialPollutant,
  });

  ReportPotentialPollutants.fromJson(dynamic json) {
    reportId = json['reportId'];
    potentialPollutantId = json['potentialPollutantId'];
    potentialPollutant = json['potentialPollutant'] != null
        ? PotentialPollutant.fromJson(json['potentialPollutant'])
        : null;
  }

  int? reportId;
  int? potentialPollutantId;
  PotentialPollutant? potentialPollutant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reportId'] = reportId;
    map['potentialPollutantId'] = potentialPollutantId;
    if (potentialPollutant != null) {
      map['potentialPollutant'] = potentialPollutant?.toJson();
    }
    return map;
  }
}

class PotentialPollutant {
  PotentialPollutant({
    this.id,
    this.name,
    this.nameEnglish,
  });

  PotentialPollutant.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}

class ReportPhotos {
  ReportPhotos({
    this.id,
    this.photo,
    this.reportId,
  });

  ReportPhotos.fromJson(dynamic json) {
    id = json['id'];
    photo = json['photo'];
    reportId = json['reportId'];
  }

  int? id;
  String? photo;
  int? reportId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photo'] = photo;
    map['reportId'] = reportId;
    return map;
  }
}

class ResponsibleAuthority {
  ResponsibleAuthority({
    this.id,
    this.name,
    this.description,
  });

  ResponsibleAuthority.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  int? id;
  String? name;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    return map;
  }
}

class SurfaceWater {
  SurfaceWater({
    this.id,
    this.name,
    this.nameEnglish,
  });

  SurfaceWater.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}

class PollutantPlace {
  PollutantPlace({
    this.id,
    this.name,
    this.nameEnglish,
  });

  PollutantPlace.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}

class LandForm {
  LandForm({
    this.id,
    this.name,
    this.nameEnglish,
  });

  LandForm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}

class City {
  City({
    this.id,
    this.name,
    this.nameEnglish,
    this.governorateId,
    this.governorate,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
    governorateId = json['governorateId'];
    governorate = json['governorate'] != null
        ? Governorate.fromJson(json['governorate'])
        : null;
  }

  int? id;
  String? name;
  String? nameEnglish;
  int? governorateId;
  Governorate? governorate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    map['governorateId'] = governorateId;
    if (governorate != null) {
      map['governorate'] = governorate?.toJson();
    }
    return map;
  }
}

class Governorate {
  Governorate({
    this.id,
    this.name,
    this.nameEnglish,
    this.regionId,
    this.region,
  });

  Governorate.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
    regionId = json['regionId'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  int? id;
  String? name;
  String? nameEnglish;
  int? regionId;
  Region? region;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    map['regionId'] = regionId;
    if (region != null) {
      map['region'] = region?.toJson();
    }
    return map;
  }
}

class Region {
  Region({
    this.id,
    this.name,
    this.nameEnglish,
  });

  Region.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEnglish = json['nameEnglish'];
  }

  int? id;
  String? name;
  String? nameEnglish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameEnglish'] = nameEnglish;
    return map;
  }
}
//
// class City {
//   City({
//     this.id,
//     this.name,
//     this.nameEnglish,
//     this.governorateId,
//     this.governorate,
//   });
//
//   City.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     nameEnglish = json['nameEnglish'];
//     governorateId = json['governorateId'];
//     governorate = json['governorate'] != null
//         ? Governorate.fromJson(json['governorate'])
//         : null;
//   }
//
//   int? id;
//   String? name;
//   String? nameEnglish;
//   int? governorateId;
//   Governorate? governorate;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['nameEnglish'] = nameEnglish;
//     map['governorateId'] = governorateId;
//     if (governorate != null) {
//       map['governorate'] = governorate?.toJson();
//     }
//     return map;
//   }
// }
//
// class Governorate {
//   Governorate({
//     this.id,
//     this.name,
//     this.nameEnglish,
//     this.regionId,
//     this.region,
//   });
//
//   Governorate.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     nameEnglish = json['nameEnglish'];
//     regionId = json['regionId'];
//     region = json['region'] != null ? Region.fromJson(json['region']) : null;
//   }
//
//   int? id;
//   String? name;
//   String? nameEnglish;
//   int? regionId;
//   Region? region;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['nameEnglish'] = nameEnglish;
//     map['regionId'] = regionId;
//     if (region != null) {
//       map['region'] = region?.toJson();
//     }
//     return map;
//   }
// }
//
// class Region {
//   Region({
//     this.id,
//     this.name,
//     this.nameEnglish,
//   });
//
//   Region.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     nameEnglish = json['nameEnglish'];
//   }
//
//   int? id;
//   String? name;
//   String? nameEnglish;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['nameEnglish'] = nameEnglish;
//     return map;
//   }
// }
