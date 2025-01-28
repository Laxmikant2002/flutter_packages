library;

import 'package:dio/dio.dart';
import 'models.dart';

class BackendService {
  final Dio _dio;

  BackendService({required Dio dio}) : _dio = dio;

  Future<AddFeedResponse> addFeed(AddFeedRequest request) async {
    try {
      final response = await _dio.post(
        'feeds',
        data: request.toJson(),
      );
      return AddFeedResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add feed: $e');
    }
  }

  Future<AddFeedReportResponse> addFeedReport(
      AddFeedReportRequest request) async {
    try {
      final response = await _dio.post(
        'feeds/report/',
        data: request.toJson(),
      );
      return AddFeedReportResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add feed report: $e');
    }
  }
}
