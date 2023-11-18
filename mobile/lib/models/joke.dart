import 'package:mobile/models/content.dart';

class Joke {
  Joke(this.content, this.like, this.dislike);
  Content content;
  final int like;
  final int dislike;
}
