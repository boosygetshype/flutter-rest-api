import 'dart:convert';

import 'package:rest_api/constants/api/api_constants.dart';
import 'package:rest_api/model/comment/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentAPIService {
  Future<List<CommentModel>> getComments() async {
    final response = await http.get(Uri.parse(url));

    List<CommentModel> comments = [];

    List<dynamic> responseList = jsonDecode(response.body);

    for (var i = 0; i < responseList.length; i++) {
      comments.add(CommentModel.fromJson(responseList[i]));
    }
    return comments;
  }
}
