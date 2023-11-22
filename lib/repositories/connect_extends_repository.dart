// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_tmdb/config/environment.dart';

class ConnectExtendsRepository {
  Environment environment = Environment();
    late String BASE_URL;

    ConnectExtendsRepository() {
    BASE_URL = environment.config.apiHost;
  }

  Future<void> onInit() async {
    // Create an instance of the client
    http.Client client = http.Client();

    // Make a GET request to the BASE_URL
    http.Response response = await client.get(Uri.parse(BASE_URL));

    // Print the response
    debugPrint(response.body);

    // Close the client to free up resources
    client.close();
  }
}
