import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uoni_test/models/login_response.dart';

/// This class provides methods to interact with an API using HTTP requests.
class ApiServices {
  /// The base URL for API requests.
  static String baseUrl = 'https://dev.cpims.net/api/';

  /// The bearer token used for authentication.
  static String bearerToken = '';

  /// Logs a user in by sending a POST request to the login endpoint.
  ///
  /// The [userName] and [passWord] parameters are required for authentication.
  /// Returns a [LoginResponse] object indicating the success or failure of the login attempt.
  ///
  /// Throws an exception if the HTTP request fails or encounters an error.
  static Future<LoginResponse> logUserIn({
    required String userName,
    required String passWord,
  }) async {
    final http.Response response = await http.post(
      Uri.parse('$baseUrl/token/'),
      body: <String, dynamic>{
        'username': userName,
        'password': passWord,
      },
    );
    if (response.statusCode == 200) {
      bearerToken = jsonDecode(response.body)['refresh'];
      return LoginResponse(successful: true, message: "Login Successful");
    } else {
      return LoginResponse(successful: false, message: response.body);
    }
  }

  /// Retrieves dashboard data by sending a GET request to the dashboard endpoint.
  ///
  /// Uses the bearer token for authentication in the headers.
  /// Returns the response body as a string.
  ///
  /// Throws an exception if the HTTP request fails or encounters an error.
  static Future<String> pullDashboardData() async {
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/dashboard/'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
      },
    );
    return response.body;
  }
}
