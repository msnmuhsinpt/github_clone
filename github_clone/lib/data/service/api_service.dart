import 'dart:convert';
import 'dart:developer';
import '../../infrastructure/app_urls.dart';
import 'package:http/http.dart' as http;

import '../api_model/repository_response.dart';

class APIService {
  ///repository response

  Future<RepositoryResponse> getRepo(user) async {
    try {
      var response = await http.Client()
          .get(Uri.parse('${AppUrls.baseUrl}/${user + AppUrls.repoUrls}'));

      if (response.statusCode == 200) {
        // get this json count
        String data = response.body;
        List jsonList = jsonDecode(data);
        int repoCount = jsonList.length;
        log("JsonList>>>>>${jsonList.length}");
        log("<<<<<URL>>>>${AppUrls.baseUrl}/${user + AppUrls.repoUrls}");
        return RepositoryResponse.fromJson(json.decode(response.body));
      } else {
        return RepositoryResponse(code: 200);
      }
    } catch (e) {
      log("Error in API $e");
      if (e.toString().startsWith("SocketException")) {
        //no inter net case
        return RepositoryResponse(code: 200);
      } else {
        return RepositoryResponse(code: 500);
      }
    }
  }
}
