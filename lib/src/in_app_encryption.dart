import 'package:encrypt/encrypt.dart';

///Input the text you want to encrypt and use a key that will be used for encryption, the key can be anything but you need later for decryption
///
/// Keep the key saved otherwise use hashEncrypt method
inAppEncrypt({required Object text, required Object key}) =>
    _inAppEncryption(text.toString(), key.toString());

///Cant be decrypted later
///
/// It is used to store and compare string in database
hashEncrypt({required Object text, required Object keyIV}) =>
    _hashEncryption(text.toString(), keyIV.toString());

String _inAppEncryption(plainText, ptKey) {
  if (ptKey.length > 32) {
    throw ArgumentError('Input must have a length of 32 or Less characters.');
  }
  while (ptKey.length < 32) {
    ptKey = ptKey + "#";
  }
  final keyBytes = Key.fromUtf8(ptKey);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(keyBytes));
  final encrypted = encrypter.encrypt(plainText, iv: iv);
  return encrypted.base64;
}

///Hashing a text to compare with database
String _hashEncryption(String plainText, String keyIV) {
  final key = Key.fromUtf8('wctdg4SXTIFvvGreJ91OQLkQRNqE99I6');
  final iv = IV.fromUtf8(keyIV); // Use a fixed IV
  final encrypter = Encrypter(Salsa20(key));

  // Encrypt the plaintext using the fixed IV
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  // Return the base64 representation of the encrypted text
  return encrypted.base64;
}
