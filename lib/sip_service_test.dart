// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:sip_ua/sip_ua.dart';
// import 'package:asterisk_voip/sip_service.dart';

// // Mock SIPUAHelper
// class MockSIPUAHelper extends Mock implements SIPUAHelper {}

// void main() {
//   late SIPService sipService;
//   late MockSIPUAHelper mockHelper;

//   setUp(() {
//     mockHelper = MockSIPUAHelper();
//     sipService = SIPService();
//   });

//   group('SIPService Tests', () {
//     test('registerSIP should configure correct settings', () {
//       // When
//       sipService.registerSIP();

//       // Then
//       verify(mockHelper.start(any)).called(1);
//     });

//     test('makeCall should call with correct SIP URI', () {
//       // Given
//       const testNumber = '200';
//       const expectedUri = 'sip:200@34.132.253.18';

//       // When
//       sipService.makeCall(testNumber);

//       // Then
//       verify(mockHelper.call(expectedUri)).called(1);
//     });
//   });
// }
