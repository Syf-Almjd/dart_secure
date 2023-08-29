import 'dart:convert';
import 'package:encrypt/encrypt.dart';

///Input the encrypted text and use a key that was used for encryption.
inAppDecrypt({required Object cipherText, required Object key}) =>
    _inAppDecryption(cipherText.toString(), key.toString());

String _inAppDecryption(cipher, ptKey) {
  if (ptKey.length > 32) {
    throw ArgumentError('Input must have a length of 32 or Less characters.');
  }
  while (ptKey.length < 32) {
    ptKey = ptKey + "#";
  }
  final keyBytes = Key.fromUtf8(ptKey);
  final encryptedBytes = base64Decode(cipher);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(keyBytes));
  final decrypted = encrypter.decrypt(Encrypted(encryptedBytes), iv: iv);
  return decrypted;
}
