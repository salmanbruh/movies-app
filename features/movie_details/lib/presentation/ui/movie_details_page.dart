import 'package:core/core.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_list/domain/entities/movies_entity.dart';
import 'package:shared/common/common.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;
  const MovieDetailsPage({required this.movieId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          Modular.get<MovieDetailsCubit>()..fetchMovieDetails(movieId),
      child: MovieDetailsView(movieId: movieId),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({required this.movieId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case MovieDetailsStatus.initial:
              return const MovieDetailsEmpty();
            case MovieDetailsStatus.loading:
              return const MovieDetailsLoading();
            case MovieDetailsStatus.failure:
              return const MovieDetailsFailure();
            case MovieDetailsStatus.success:
              return MovieDetailsSuccess(movie: state.movie!);
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      );
}

class MovieDetailsEmpty extends StatelessWidget {
  const MovieDetailsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MovieDetailsLoading extends StatelessWidget {
  const MovieDetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class MovieDetailsFailure extends StatelessWidget {
  const MovieDetailsFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("An error has occured, please try again!"),
    );
  }
}

class MovieDetailsSuccess extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetailsSuccess({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Stack(
            children: [
              _buildImage(context),
              _buildMovieDetails(context),
            ],
          ),
        ),
        Expanded(flex: 3, child: _buildOverview(context)),
      ],
    );
  }

  Widget _buildImage(BuildContext context) => Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: AppConfig.of(context).baseImageUrl +
                  ImageSizeUrlConstants.baseDetailsPosterSizeUrl +
                  movie.posterPath,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitWidth,
                  ),
                  // borderRadius: BorderRadius.circular(150),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Modular.get<ColorPalettes>().darkBG,
                  const Color(0x00000000),
                  const Color(0x00000000),
                  Modular.get<ColorPalettes>().darkBG,
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildMovieDetails(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: movie.voteAverage / 2,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (_) {},
              itemSize: 32,
              ignoreGestures: true,
              allowHalfRating: true,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildReleaseYear(),
                const Text(" | "),
                _buildRunTime(),
                const Text(" | "),
                _buildGenres(),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      );

  Widget _buildReleaseYear() => Text(movie.releaseDate.substring(0, 4));

  Widget _buildRunTime() {
    int hour = movie.runtime ~/ 60;
    int minutes = movie.runtime % 60;
    return Row(
      children: [
        Text(hour.toString()),
        const Text(" h "),
        Text(minutes.toString()),
        const Text(" min"),
      ],
    );
  }

  Widget _buildGenres() {
    List<String> genreNames = [];
    for (var i = 0; i < 3 && i < movie.genres.length; i++) {
      var genreName = movie.genres[i]["name"];
      genreNames.add(genreName);
    }
    return Text(genreNames.join(", "));
  }

  Widget _buildOverview(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Text(
                "Overview",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                movie.overview,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
