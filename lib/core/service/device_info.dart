
import 'package:flutter/services.dart';

class DeviceInfoService {
  static const MethodChannel _channel = MethodChannel('com.example.tezda.device/info');

  static Future<Map<String, String>> getDeviceInfo() async {
    final info = await _channel.invokeMethod<Map>("getDeviceInfo");
    return info?.map((key, value) => MapEntry(key.toString(), value.toString())) ?? {};
  }
}