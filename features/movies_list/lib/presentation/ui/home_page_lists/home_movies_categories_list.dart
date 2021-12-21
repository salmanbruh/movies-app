import 'package:flutter/material.dart';

class HomeMoviesCategoriesList extends StatelessWidget {
  final String categoryName;
  final VoidCallback viewAllOnTapFunction;
  final Widget list;

  const HomeMoviesCategoriesList({
    required this.categoryName,
    required this.viewAllOnTapFunction,
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategoryHeader(context),
        _buildMoviesList(context),
      ],
    );
  }

  Widget _buildCategoryHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryName,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          InkWell(
            child: Text(
              "View all",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: const Color(0xFF838387),
                    fontWeight: FontWeight.normal,
                  ),
            ),
            onTap: viewAllOnTapFunction,
          ),
        ],
      );

  Widget _buildMoviesList(BuildContext context) =>
      SizedBox(height: 296, child: list);
}
