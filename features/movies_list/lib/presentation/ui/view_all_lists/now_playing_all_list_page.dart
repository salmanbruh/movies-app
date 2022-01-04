import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_list/presentation/bloc/view_all_lists/all_now_playing_movies_list_bloc.dart';
import 'package:movies_list/presentation/ui/view_all_lists/view_all_list.dart';

class NowPlayingAllListPage extends StatelessWidget {
  const NowPlayingAllListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewAllListPage(
      categoryName: "Now Playing Movies",
      list: Container(),
    );
  }
}
