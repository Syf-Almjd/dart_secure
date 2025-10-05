import 'package:http/http.dart' as http;
import 'dart:convert';

/// Manages client validation against a backend server.
class ClientValidator {
  /// The default base backend server URL for client validation.
  /// This can be overridden using [setBackendBaseUrl].
  static String _backendBaseUrl = 'https://vapp.alaqsa.tech/api/validate-app/';

  /// Sets the base backend server URL for client validation.
  ///
  /// This allows overriding the default placeholder URL. The [clientId] will be
  /// appended to this base URL as a path segment.
  static void setBackendBaseUrl(String url) {
    _backendBaseUrl = url;
  }

  /// Validates a client by sending a request to a backend server.
  ///
  /// This method sends a GET request to the configured backend base URL with the client's ID
  /// appended as a path segment (e.g., `https://your-backend-server.com/validate-app/clientId`).
  /// It returns `true` if:
  /// 1. The server responds with a 200 OK status and the response body is 'true'.
  /// 2. Any error occurs during the request (e.g., network error, non-200 status code).
  ///
  /// It returns `false` if the server responds with a 200 OK status but the response body is not 'true'.
  ///
  /// [clientId] The unique identifier of the client to validate.
  /// Returns a `Future<bool>` indicating whether the client is considered valid
  /// or if an error occurred during validation.
  static Future<bool> validateClient(String clientId) async {
    try {
      final validationUrl = Uri.parse('$_backendBaseUrl$clientId');
      final response = await http.post(validationUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final bool isAppValid = responseData['isAppVaild'] ??
            true; // Default to true if key is missing

        if (isAppValid) {
          return true;
        } else {
          // Server responded with 200, and 'isAppVaild' is false.
          return false;
        }
      } else {
        // Server returned a non-200 status code, treat as an error.
        print('Server error: ${response.statusCode} - ${response.body}');
        return true; // As per requirement: if server has error, method returns true.
      }
    } catch (e) {
      // Network error or any other exception during the request.
      print('Error validating client: $e');
      return true; // As per requirement: if server has error, method returns true.
    }
  }
}
