// Add Feed Request
class AddFeedRequest {
  String feedType;
  String feedVisibility;
  String description;
  String? fileType;

  AddFeedRequest({
    required this.feedType,
    required this.feedVisibility,
    required this.description,
    this.fileType,
  });

  factory AddFeedRequest.fromJson(Map<String, dynamic> json) => AddFeedRequest(
        feedType: json["feedType"],
        feedVisibility: json["feedVisibility"],
        description: json["description"],
        fileType: json["fileType"],
      );

  Map<String, dynamic> toJson() => {
        "feedType": feedType,
        "feedVisibility": feedVisibility,
        "description": description,
        "fileType": fileType,
      };
}

// Add Feed Response
class AddFeedResponse {
  bool status;
  Feed feed;

  AddFeedResponse({
    required this.status,
    required this.feed,
  });

  factory AddFeedResponse.fromJson(Map<String, dynamic> json) =>
      AddFeedResponse(
        status: json["status"],
        feed: Feed.fromJson(json["feed"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "feed": feed.toJson(),
      };
}

class Feed {
  String id;
  String userId;
  String feedType;
  String feedVisibility;
  String description;
  DateTime updatedAt;
  DateTime createdAt;

  Feed({
    required this.id,
    required this.userId,
    required this.feedType,
    required this.feedVisibility,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        id: json["id"],
        userId: json["userId"],
        feedType: json["feedType"],
        feedVisibility: json["feedVisibility"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "feedType": feedType,
        "feedVisibility": feedVisibility,
        "description": description,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

// Add Feed Report Request
class AddFeedReportRequest {
  String feedId;
  String? description;

  AddFeedReportRequest({
    required this.feedId,
    this.description,
  });

  factory AddFeedReportRequest.fromJson(Map<String, dynamic> json) =>
      AddFeedReportRequest(
        feedId: json["feedId"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "feedId": feedId,
        "description": description,
      };
}

// Add Feed Report Response
class AddFeedReportResponse {
  bool status;
  FeedReport feedReport;

  AddFeedReportResponse({
    required this.status,
    required this.feedReport,
  });

  factory AddFeedReportResponse.fromJson(Map<String, dynamic> json) =>
      AddFeedReportResponse(
        status: json["status"],
        feedReport: FeedReport.fromJson(json["feedReport"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "feedReport": feedReport.toJson(),
      };
}

class FeedReport {
  String id;
  String userId;
  String feedId;
  String description;
  String updatedAt;
  String createdAt;

  FeedReport({
    required this.id,
    required this.userId,
    required this.feedId,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
  });

  factory FeedReport.fromJson(Map<String, dynamic> json) => FeedReport(
        id: json["id"],
        userId: json["userId"],
        feedId: json["feedId"],
        description: json["description"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "feedId": feedId,
        "description": description,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
      };
}
