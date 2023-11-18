import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/jokes_content.dart';
import 'package:mobile/models/content.dart';

class DisplayJokesContent extends StatefulWidget {
  final void Function(String content) onVotedJoke;
  const DisplayJokesContent({super.key, required this.onVotedJoke});

  @override
  State<DisplayJokesContent> createState() {
    return _DisplayJokesContentState();
  }
}

class _DisplayJokesContentState extends State<DisplayJokesContent> {
  var curIndex = 0;
  var like = 0;
  var dislike = 0;

  votingJoke(Content jokeContent, bool isLike) async {
    widget.onVotedJoke(jokeContent.content);

    jokeContent.id = generateId(jokeContent.content);

    final existDatabase = await FirebaseFirestore.instance
        .collection("jokes")
        .doc(jokeContent.id)
        .get();

    final idExist = existDatabase.data()?['id'];
    if (mounted) {
      setState(() {
        curIndex++;
        if (idExist != jokeContent.id) {
          FirebaseFirestore.instance
              .collection("jokes")
              .doc(jokeContent.id)
              .set({
            "id": jokeContent.id,
            "joke_content": jokeContent.content,
            "like": isLike ? like + 1 : like,
            "dislike": isLike ? dislike : dislike + 1
          });

          like = 0;
          dislike = 0;
        } else {
          like = existDatabase.data()?['like'];

          dislike = existDatabase.data()?['dislike'];

          isLike == true
              ? FirebaseFirestore.instance
                  .collection("jokes")
                  .doc(idExist)
                  .update({"like": like + 1})
              : FirebaseFirestore.instance
                  .collection("jokes")
                  .doc(idExist)
                  .update({"dislike": dislike + 1});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final jokeContent = contents[curIndex];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 34, 16, 34),
          child: Text(
            jokeContent.content,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 96, 96, 96)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  votingJoke(contents[curIndex], true);
                },
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(255, 44, 126, 219),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                child: const Text("This is funny!"),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  votingJoke(contents[curIndex], false);
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(255, 42, 179, 99),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                child: const Text("This is not funny."),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
