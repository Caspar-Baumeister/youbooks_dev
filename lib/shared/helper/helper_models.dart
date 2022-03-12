import 'package:youbooks/model/books.dart';
import 'package:youbooks/model/youtuber.dart';

class YoutuberWithCount {
  Youtuber youtuber;
  num count;

  YoutuberWithCount({required this.youtuber, required this.count});
}

class BookWithCount {
  Book book;
  num count;

  BookWithCount({required this.book, required this.count});
}
