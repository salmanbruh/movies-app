import 'package:flutter/material.dart';

class ViewAllListPage extends StatelessWidget {
  final String categoryName;
  final Widget list;
  const ViewAllListPage({
    required this.categoryName,
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
          preferredSize: const Size.fromHeight(1),
        ),
        bottomOpacity: .5,
      ),
      body: list,
    );
  }
}
