import 'package:flutter_test/flutter_test.dart';
import 'package:backend_service/backend_service.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:backend_service/models.dart';

@GenerateMocks([Dio])
import 'backend_service_test.mocks.dart';

void main() {
  late BackendService backendService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    backendService = BackendService(dio: mockDio);
  });

  test('addFeed returns data on success', () async {
    final responsePayload = {
      "status": true,
      "feed": {
        "id": "c8170fc6-e0a5-4ac1-baa1-5d560ffea867",
        "userId": "df03c675-f158-4375-bc99-b6040bd93b12",
        "feedType": "normal",
        "feedVisibility": "everyone",
        "description": "This is a sample description.",
        "updatedAt": "2025-01-22T12:30:25.908Z",
        "createdAt": "2025-01-22T12:30:25.908Z"
      }
    };

    when(mockDio.post('feeds', data: anyNamed('data')))
        .thenAnswer((_) async => Response(
              data: responsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: 'feeds'),
            ));

    final request = AddFeedRequest(
      feedType: 'normal',
      feedVisibility: 'everyone',
      description: 'This is a sample description.',
    );

    final response = await backendService.addFeed(request);

    expect(response.status, true);
    expect(response.feed.id, "c8170fc6-e0a5-4ac1-baa1-5d560ffea867");
  });

  test('addFeedReport returns data on success', () async {
    final responsePayload = {
      "status": true,
      "feedReport": {
        "id": "string",
        "userId": "string",
        "feedId": "string",
        "description": "Optional description",
        "updatedAt": "string",
        "createdAt": "string"
      }
    };

    when(mockDio.post('feeds/report/', data: anyNamed('data')))
        .thenAnswer((_) async => Response(
              data: responsePayload,
              statusCode: 200,
              requestOptions: RequestOptions(path: 'feeds/report/'),
            ));

    final request = AddFeedReportRequest(
      feedId: 'string',
      description: 'Optional description',
    );

    final response = await backendService.addFeedReport(request);

    expect(response.status, true);
    expect(response.feedReport.id, "string");
  });
}
