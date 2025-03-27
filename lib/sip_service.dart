import 'package:sip_ua/sip_ua.dart';
import 'package:asterisk_voip/sip_service.dart';

class SIPService {
  final SIPUAHelper _user = SIPUAHelper();

  void registerSIP() {
    final settings = UaSettings();
    settings.webSocketUrl = 'wss://call.bonprix.mr:8089/ws';
    settings.uri = 'sip:100@call.bonprix.mr';
    settings.authorizationUser = '100';
    settings.password = 'ABCfreepbx123';
    settings.displayName = 'Mon Test SIP';

    _user.start(settings);
  }

  void makeCall(String target) {
    // Format the SIP URI using the target parameter
    String sipUri = 'sip:$target@call.bonprix.mr';
    _user.call(sipUri);
  }
}
