import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks/provider/books_provider.dart';
import 'package:youbooks/provider/youtuber_provider.dart';
import 'package:youbooks/screens/home/home.dart';
import 'package:youbooks/shared/loading.dart';

class DataLoader extends StatelessWidget {
  const DataLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);

    return (youtuberProvider.initialized && booksProvider.initialized)
        ? const Home()
        : const Loading();
  }
}
