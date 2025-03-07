import 'package:shared_preferences/shared_preferences.dart';

class Share {
  SharedPreferences? _share;

  Future<void> setInstance() async {
    try {
      _share ??= await SharedPreferences.getInstance();
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      await setInstance();
    }
  }
  Future<SharedPreferences> get shareInstance async {
    if (_share == null) {
      await setInstance();
    }

    return _share!;
  }
}
