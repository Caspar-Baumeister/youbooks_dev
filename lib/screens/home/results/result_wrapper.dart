import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:youbooks/provider/books_provider.dart';
import 'package:youbooks/provider/youtuber_provider.dart';
import 'package:youbooks/screens/home/results/book_result/book_result.dart';
import 'package:youbooks/screens/home/results/youtuber_result/youtuber_result.dart';
import 'package:youbooks/shared/info_home.dart';

// returns either the book result if a book was selected
// or a youtuber result if an youtuber was collected
class ResultWrapper extends StatelessWidget {
  const ResultWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);

    return booksProvider.selectedBookIds.isNotEmpty
        ? const BookResult()
        : youtuberProvider.selectedYoutuber.isNotEmpty
            ? const YoutuberResult()
            : const InfoHome();
  }
}
