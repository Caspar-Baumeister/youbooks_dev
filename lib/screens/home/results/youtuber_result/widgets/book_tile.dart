import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks/model/books.dart';
import 'package:youbooks/provider/books_provider.dart';
import 'package:youbooks/provider/youtuber_provider.dart';
import 'package:youbooks/shared/helper/helper_functions.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.item, required this.count})
      : super(key: key);

  final Book item;
  final num count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(item.amzLink),
      child: ListTile(
        leading: ClipRRect(
          child: Image.network(
            item.imgSrc,
            // loadingBuilder: (ctx, i, k) => Container(
            //     alignment: Alignment.center,
            //     width: 70,
            //     height: 70,
            //     child: const Center(child: CircularProgressIndicator())),
            errorBuilder: (ctx, o, n) {
              return const Icon(Icons.error);
            },
            height: 70.0,
            width: 70.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item.title),
        subtitle: Text(item.author),
        trailing: count > 1
            ? GestureDetector(
                onTap: () {
                  YoutuberProvider youtuberProvider =
                      Provider.of<YoutuberProvider>(context, listen: false);
                  youtuberProvider.selectedYoutuber = [];
                  youtuberProvider.youtuberInSearch = [];
                  Provider.of<BooksProvider>(context, listen: false)
                      .addBook(item);
                },
                child: Text(
                  "by ${count.toStringAsFixed(0)}\nYoutuber's",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              )
            : null,
      ),
    );
  }
}
