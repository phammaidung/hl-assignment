import 'package:flutter/material.dart';
import 'package:mobile/data/jokes_content.dart';

class DisplayJokesContent extends StatefulWidget {
  final void Function(String answer) onVotedJoke;
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

  votingJoke(String content, bool isLike) {
    widget.onVotedJoke(content);

    setState(() {
      curIndex++;

      isLike == true ? like++ : dislike++;
    });
    //final jokeContent = Joke(contents[curIndex], like, dislike);
  }

  List<String> votedJokesList = [];
  var isEmptyJoke = false;

  onVotedJoke(String content) {
    votedJokesList.add(content);
    if (votedJokesList.length == contents.length) {
      setState(() {
        isEmptyJoke = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String content = contents[curIndex].content;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 34, 16, 34),
          child: Text(
            content,
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
                  votingJoke(content, true);
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
                  votingJoke(content, false);
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
