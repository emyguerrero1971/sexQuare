import 'package:flutter/services.dart';
import 'package:unique_identifier/unique_identifier.dart';

class DeviceService {
  Future<String?> getUniqueIdentifier() async {
    String? identifier;
    try {
      identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      identifier = null;
    }
    return identifier;
  }
}
