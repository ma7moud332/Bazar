import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:const [
       CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text('Best Seller',
            style: Styles.titleMedium,
          ),
        ),

      ],
    );
  }
}