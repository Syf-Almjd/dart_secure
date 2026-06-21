import 'package:dart_secure/dart_secure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dart Secure Tests', () {
    test('AES In-App Encryption and Decryption Roundtrip', () {
      const originalText = 'Highly sensitive user data!';
      const key = 'secureKey123';
      
      final encrypted = inAppEncrypt(text: originalText, key: key);
      expect(encrypted, contains(':'));
      
      final decrypted = inAppDecrypt(cipherText: encrypted, key: key);
      expect(decrypted, equals(originalText));
    });

    test('Salsa20 Symmetric Encryption and Decryption Roundtrip', () {
      const originalText = 'Confidential details';
      const keyIV = '1234567890123456'; // Exactly 16 characters
      
      final encrypted = symmetricEncrypt(text: originalText, keyIV: keyIV);
      final decrypted = symmetricDecryption(cipherText: encrypted, key: keyIV);
      
      expect(decrypted, equals(originalText));
    });

    test('SHA-256 Hashing', () {
      const plainText = 'password123';
      const salt = 'saltKey123';
      
      final hash1 = hashEncrypt(plainText: plainText, keyIV: salt);
      final hash2 = hashEncrypt(plainText: plainText, keyIV: salt);
      
      expect(hash1, equals(hash2));
      expect(hash1.length, equals(64)); // hex string of 32 bytes SHA-256 is 64 chars
    });
  });
}
