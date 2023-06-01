import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_states.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/utils/enums.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
        buildWhen: (previous, current) =>previous.popularState != current.popularState ,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.isLoading:
            return Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );
          case RequestState.success:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                width: 120.0,
                                height: 170.0,
                                fit: BoxFit.cover,
                                imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                              Positioned(
                                bottom:10.0,
                                left: 10,
                                child: Text(movie.title,style: GoogleFonts.poppins(
                                  //fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                  color: Colors.white,
                                ),),)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return  SizedBox(
              height: 400,
              child: Center(child: Text(state.popularState.toString()),),
            );
        }


      },
    );
  }
}
