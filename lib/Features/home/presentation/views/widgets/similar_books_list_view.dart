import 'package:flutter/cupertino.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return const Padding(
            padding:  EdgeInsets.only(right: 5),
            child:  CustomBookImage(),
          );
        },
      ),
    );
  }
}