import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 42,),

        const Text(
          'The Jungle Book',style:
        Styles.textStyle30,
        ),
        const SizedBox(height: 6,),
        Opacity(
          opacity: .7,
          child: Text(
            'J.K. Rowling',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        const SizedBox(height: 18,),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center,),

        const SizedBox(height: 37,),
        const BookAction(),
      ],
    );
  }
}
