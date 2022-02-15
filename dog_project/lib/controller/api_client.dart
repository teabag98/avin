import 'dart:convert';

import 'package:dog_project/model/dog_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<List<DogModel>> getDogs() async {
    final request = http.Client();

    String stringUrl = "https://api.thedogapi.com/v1/breeds";

    Uri uri = Uri.parse(stringUrl);

    // DogModel ? dogs;

    // return dogs;

    http.Response response =
        await request.get(uri, headers: {"Content-Type": "application/json"});

    List<DogModel> dogs = [];

    if (response.statusCode == 200) {
      //store as a list of json objects
      List<dynamic> jsonList = jsonDecode(response.body);

      print(response.statusCode);
      dogs = jsonList.map((dog) => DogModel.fromJson(dog)).toList();
    } else {
      throw Exception("Failed to load dogs");
    }

    return dogs;
  }
}
