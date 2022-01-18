import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/ui/launcher/app_config.dart';
import 'package:movies_list/domain/domain.dart';
import 'package:shared/common/common.dart';

class HomePageMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const HomePageMovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: ImageSizeConstants.homePosterWidth,
      child: InkWell(
        onTap: () => Modular.to.pushNamed(
          Modular.get<NamedRoutes>().movies + "/${movie.id}",
          arguments: movie,
        ),
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPosterImage(context, movie),
            const SizedBox(height: 8),
            _buildMovieTitle(context, movie),
            const SizedBox(height: 8),
            _buildMovieRating(context, movie),
          ],
        ),
      ),
    );
  }

  Widget _buildPosterImage(BuildContext context, MovieEntity movie) => SizedBox(
        height: ImageSizeConstants.homePosterHeight,
        child: Center(
          child: movie.posterPath != ""
              ? CachedNetworkImage(
                  imageUrl: AppConfig.of(context).baseImageUrl +
                      ImageSizeUrlConstants.baseHomePosterSizeUrl +
                      movie.posterPath,
                  imageBuilder: (context, imageProvider) => Container(
                    width: ImageSizeConstants.homePosterWidth,
                    height: ImageSizeConstants.homePosterHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Container(
                  child: const Text("No Image"),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
        ),
      );

  Widget _buildMovieTitle(BuildContext context, MovieEntity movie) => Flexible(
        child: Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Widget _buildMovieRating(BuildContext context, MovieEntity movie) =>
      RatingBar.builder(
        initialRating: movie.voteAverage / 2,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (_) => {},
        itemSize: 18,
        ignoreGestures: true,
        allowHalfRating: true,
      );
}
