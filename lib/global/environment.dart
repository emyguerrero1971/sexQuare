import 'dart:io';

// class Environment {
//   static String apiUrl = 'https://sexquare.com/api';

//   static String socketUrl = 'https://sexquare.com';
// }
class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.0.107:80/api'
      : 'http://localhost:80/api';

  static String socketUrl =
      Platform.isAndroid ? 'http://192.168.0.107:80' : 'http://localhost:80';

  static String keyServer =
      'AAAAgpnLHCY:APA91bGRbHh8uScnSjdWavVowm7dqO1xFV7cTYL77-VBEwjFY7ueDMBjeXUA-rxpjumv7VUX5bfV2PvvWIdJx2imO0G-IdNN54bfLZxSHeUFBVc2I837Qe_CkycUygxCmCj2CWG2yTyB';

  static String mapBoxAccessToken =
      'sk.eyJ1IjoicG93ZXJ4cXVhcmUiLCJhIjoiY2xlc3I2djJhMDd1ejNxczl2eHhjcWV5eiJ9.RjqDbed-GB2R0xPEmINPug';
}
