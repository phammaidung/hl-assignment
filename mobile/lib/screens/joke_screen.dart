import 'package:flutter/material.dart';
import 'package:mobile/data/jokes_content.dart';
import 'package:mobile/widgets/display_jokes.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  List<String> votedJokesList = [];
  var activeScreen = false;

  onVotedJoke(String content) {
    votedJokesList.add(content);
    if (votedJokesList.length == contents.length) {
      setState(() {
        activeScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo_HLSolutions.png"),
        ),
        actions: const [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Handicrafted by",
                style: TextStyle(color: Color.fromARGB(255, 153, 153, 153)),
              ),
              Text(
                "Jim HLS",
                style: TextStyle(color: Color.fromARGB(255, 71, 71, 71)),
              )
            ],
          ),
          SizedBox(
            width: 8,
          ),
          CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/images/daisy_avatar.jpg")),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            color: const Color.fromARGB(255, 42, 179, 99),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "A joke a day keeps the doctor away",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "If you joke wrong way, your teeth have to pay. (Serious)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
                ),
              ],
            ),
          ),
          activeScreen == true
              ? Container(
                  padding: const EdgeInsets.fromLTRB(16, 34, 16, 34),
                  child: const Text(
                    "That's all the jokes for today! Come back another day!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 96, 96, 96)),
                  ),
                )
              : DisplayJokesContent(
                  onVotedJoke: onVotedJoke,
                ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "This apis created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 153, 153, 153)),
                ),
              ),
              Text(
                "Copyright 2021 HLS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 96, 96, 96)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
