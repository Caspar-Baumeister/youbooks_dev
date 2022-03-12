import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks/model/books.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:youbooks/provider/books_provider.dart';

class BookSearchTile extends StatelessWidget {
  const BookSearchTile({Key? key, required this.item, required this.controller})
      : super(key: key);

  final Book item;
  final FloatingSearchBarController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BooksProvider>(context, listen: false).addBook(item);
        controller.close();
      },
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
            item.imgSrc,
            // loadingBuilder: (ctx, i, k) => Container(
            //     alignment: Alignment.center,
            //     width: 50,
            //     height: 50,
            //     child: const Center(child: CircularProgressIndicator())),
            errorBuilder: (ctx, o, n) {
              return const Icon(Icons.error);
            },
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item.title),
        subtitle: Text(item.author),
      ),
    );
  }
}
