import 'package:flutter/material.dart';
import 'package:youbooks/screens/home/results/result_wrapper.dart';
import 'package:youbooks/screens/home/search/search.dart';

// Home widget loads all books and youtuber into state
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                height: 85,
                color: Colors.red,
              ),
              const Expanded(child: ResultWrapper()),
            ],
          ),
          const Search(),
          // To reset the database, delete everything in firebase and
          // make sure you have all the data in the file data here
          // then uncommend the following line and run the app. Press the button once and done!
          // const DevHome()
        ],
      ),
    );
  }
}
