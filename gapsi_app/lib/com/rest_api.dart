import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gapsi_app/config/rest_urls.dart';
import 'package:gapsi_app/model/configuration_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class RestApi extends StatefulWidget {
  RestApi({super.key});

  @override
  State<RestApi> createState() => _RestApiState();

  Future<ConfigurationModel?> fetchConfiguration() async {
    final ioClient = HttpClient()
      ..badCertificateCallback = ((_, __, ___) => false);
    final client = IOClient(ioClient);

    try {
      http.Response response = await client.post(
        Uri.parse(RestUrls.get_configuraction_url),
        headers: {
          'Content-Type': 'application/json',
        },
        // body: utf8.encode(jsonEncode(params)),
      );

      String data = utf8.decode(response.bodyBytes);

      if (response.statusCode == 200) {
        dynamic parsedJson = jsonDecode(data);
        return ConfigurationModel.fromJson(parsedJson);
      } else {
        return ConfigurationModel();
      }
    } on Exception catch (_) {
      return ConfigurationModel();
    } finally {
      client.close();
    }
  }
}

class _RestApiState extends State<RestApi> {
  @override
  Widget build(BuildContext context) {
    return RestApi();
  }
}
