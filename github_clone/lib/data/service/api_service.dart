import 'dart:convert';
import 'dart:developer';
import '../../infrastructure/app_urls.dart';
import 'package:http/http.dart' as http;

import '../api_model/github_user_response.dart';
import '../api_model/repository_response.dart';

class APIService {
  ///github user
  Future<GithubUserResponse> getUser(
    user,
  ) async {
    try {
      var response = await http.Client().post(Uri.parse(AppUrls.baseUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({
            "login": user,
          }));

      log("API>>>URL>>${AppUrls.baseUrl}<<<RES>>>${response.body}<<<REQ>>>${jsonEncode({
            "login": user,
          })}");

      if (response.statusCode == 200) {
        return GithubUserResponse.fromJson(json.decode(response.body));
      }
    } catch (e) {
      log("Error in API$e");
      if (e.toString().startsWith("SocketException")) {
        //no inter net case
      }
    }
    return GithubUserResponse();
  }

  ///repository response

  Future<RepositoryResponse> getRepo(user) async {
    try {
      var response = await http.Client()
          .post(Uri.parse(AppUrls.baseUrl + user + AppUrls.repoUrls),
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
              },
              body: jsonEncode({}));

      log("API>>>URL>>${AppUrls.baseUrl}<<<RES>>>${response.body}<<<REQ>>>${jsonEncode({})}");

      if (response.statusCode == 200) {
        return RepositoryResponse.fromJson(json.decode(response.body));
      } else {
        return RepositoryResponse(code: 200);
      }
    } catch (e) {
      log("Error in API$e");
      if (e.toString().startsWith("SocketException")) {
        //no inter net case
        return RepositoryResponse(code: 200);
      } else {
        return RepositoryResponse(code: 500);
      }
    }
  }
}
