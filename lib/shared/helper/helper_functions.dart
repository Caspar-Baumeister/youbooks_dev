import 'package:flutter/material.dart';
import 'package:youbooks/shared/helper/helper_models.dart';
import 'package:url_launcher/url_launcher.dart';

double calculateScore(
    // score is the percentage of shared books of searched books from youtuber books.
    // with a smnall penelty of the amount of books a youtuber named
    num amountSearch,
    num amountYoutuber,
    num amountShared) {
  return (amountSearch / amountShared) - (amountYoutuber / 10000);
}

int compareYoutuber(
  YoutuberWithCount a,
  YoutuberWithCount b,
  int amountSearch,
) {
  double scoreA =
      calculateScore(amountSearch, a.youtuber.books.length, a.count);
  double scoreB =
      calculateScore(amountSearch, b.youtuber.books.length, b.count);

  if (scoreA > scoreB) return 1;
  if (scoreA < scoreB) return -1;
  return 0;
}

int calculateSharedBooksAmount(
    List<String> bookIds, List<String> youtuberBookIds) {
  int sharedBooks = 0;
  for (String bookId in bookIds) {
    if (youtuberBookIds.contains(bookId)) {
      sharedBooks += 1;
    }
  }
  if (sharedBooks == 0) return 0;

  // procentage of searched books that the youtuber read
  return sharedBooks;
}

void launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
    suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 1.0),
      borderRadius: BorderRadius.circular(28.0),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(fontSize: 18),
    contentPadding: const EdgeInsets.fromLTRB(12.0, 2.0, 0.0, 10.0),
  );
}
