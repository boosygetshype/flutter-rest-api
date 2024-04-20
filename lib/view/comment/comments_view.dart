import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rest_api/constants/text/card_text_style.dart';
import 'package:rest_api/service/comment/comment_service.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    CommentAPIService apiService = CommentAPIService();
    apiService.getComments();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: apiService.getComments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber.shade200,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      leading: Text(snapshot.data![index].id.toString()),
                      title: Text(
                        style: CardTextStyle().titleStyle,
                        snapshot.data![index].name.toString(),
                      ),
                      subtitle: Text(
                        style: CardTextStyle().subTitleStyle,
                        snapshot.data![index].email.toString(),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(e.toString());
            } else {}
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Created by boosygetshype"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
