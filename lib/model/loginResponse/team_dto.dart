import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Team {
  final double createdBy;
  final String createdByName;
  final String createdDate;
  final String description;
  final int id;
  final int modifiedBy;
  final String modifiedByName;
  final String modifiedDate;
  final String name;
  final String status;
  final String type;

  Team(
      {this.createdBy,
      this.createdByName,
      this.createdDate,
      this.description,
      this.id,
      this.modifiedBy,
      this.modifiedByName,
      this.modifiedDate,
      this.name,
      this.status,
      this.type});

  factory Team.fromJson(Map<String, dynamic> parsedJson) {
    return Team(
        createdBy: parsedJson['createdBy'],
        createdByName: parsedJson['createdByName'],
        createdDate: parsedJson['createdDate'],
        description: parsedJson['description'],
        id: parsedJson['id'],
        modifiedBy: parsedJson['modifiedBy'],
        modifiedByName: parsedJson['modifiedByName'],
        modifiedDate: parsedJson['modifiedDate'],
        name: parsedJson['name'],
        status: parsedJson['status'],
        type: parsedJson['type']);
  }
}

class TeamList {
  final List<Team> teams;

  TeamList({this.teams});

  factory TeamList.fromJson(List<dynamic> parsedJson) {
    List<Team> teams = new List<Team>();
    teams = parsedJson.map((i) => Team.fromJson(i)).toList();
    return TeamList(teams: teams);
  }
}
