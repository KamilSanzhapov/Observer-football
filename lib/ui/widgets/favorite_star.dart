import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_explorer/domain/cubit/fav_league_cubit.dart';
import 'package:football_explorer/domain/models/league.dart';

class FavoriteStar extends StatefulWidget {
  final bool isPressed;
  final League league;
  final Function(bool isPressed) onSwitch;

  FavoriteStar({this.isPressed = false, this.onSwitch, this.league});

  @override
  _FavoriteStarState createState() => _FavoriteStarState();
}

class _FavoriteStarState extends State<FavoriteStar> {
  bool isPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavLeagueCubit>(
      create: (context) => FavLeagueCubit(),
      child: BlocBuilder<FavLeagueCubit, FavLeagueState>(
        builder: (context, favState) {
          final FavLeagueCubit favLeagueCubit = context.bloc<FavLeagueCubit>();
          if (favState is AddFavLeague && favState.id == widget.league.leagueId)
            isPressed = true;
          else if (favState is RemoveFavLeague &&
              favState.id == widget.league.leagueId)
            isPressed = false;
          else
            isPressed = widget.isPressed;

          return IconButton(
            icon: isPressed
                ? Icon(Icons.star, color: Colors.orangeAccent)
                : Icon(Icons.star_border, color: Theme.of(context).accentColor),
            onPressed: () async {
              isPressed = !isPressed;
              if (isPressed)
                await favLeagueCubit.insertFavLeague(widget.league);
              else
                await favLeagueCubit.deleteFavLeague(widget.league.leagueId);
              widget.onSwitch(isPressed);
            },
          );
        },
      ),
    );
  }
}
