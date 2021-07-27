import 'package:encrypt/encrypt.dart';

abstract class BaseEncrypt {
  appEncrypt(String data);
  appDecrypt(String encrypted);
}

class EncryptApp implements BaseEncrypt {
  static final key = Key.fromLength(32);
  final iv = IV.fromLength(16);

  final encrypter = Encrypter(AES(key));

  appEncrypt(data) {
    final encrypted = encrypter.encrypt(data, iv: iv);
    final encrypted64 = encrypted.base64;
    // print(encrypted64);
    return encrypted64;
  }

  appDecrypt(String encrypted) {
    // final decrypted = encrypter.decrypt(encrypted, iv: iv);
    final decrypted64 = encrypter.decrypt64(encrypted, iv: iv);

    return decrypted64;
  }
}
