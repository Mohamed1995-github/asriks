import 'package:sip_ua/sip_ua.dart';
import 'package:asterisk_voip/sip_service.dart';

class SIPService {
  final SIPUAHelper _user = SIPUAHelper();

  void registerSIP() {
    final settings = UaSettings();
    settings.webSocketUrl = 'ws://34.132.253.18:8088/ws';
    settings.uri = 'sip:100@34.132.253.18';
    settings.authorizationUser = '100';
    settings.password = 'Abcfreepbx12345';
    settings.displayName = 'Mon Test SIP';

    print(registerSIP);

    _user.start(settings);
  }

  void makeCall(String target) {
    _user.call('sip:$target@34.132.253.18');
  }
}
