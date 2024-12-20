import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_icon_flutter/dynamic_icon_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('dynamic_icon_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DynamicIconFlutter.platformVersion, '42');
  });
}
