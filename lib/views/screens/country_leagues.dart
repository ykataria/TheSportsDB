import 'package:flutter/material.dart';
import 'package:TheSportsDB/networking/response.dart';
import 'package:TheSportsDB/models/country_leagues.dart';
import 'package:TheSportsDB/blocs/country_league_bloc.dart';

//import UI components
import '../ui_components/error_component.dart';
import '../ui_components/list_component.dart';
import '../ui_components/loading_component.dart';

class CountryLeagues extends StatefulWidget {
  final countryName;
  CountryLeagues(this.countryName, {Key key}) : super(key: key);

  @override
  _CountryLeaguesState createState() => _CountryLeaguesState();
}

class _CountryLeaguesState extends State<CountryLeagues> {
  CountryLeagueBloc _countryLeagueBloc;

  @override
  void initState() {
    super.initState();

    // sending intial search league to be empty
    _countryLeagueBloc = CountryLeagueBloc(widget.countryName);
  }

  // search bar for searching the leagues
  Widget searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextFormField(
          cursorColor: Colors.red,
          minLines: 1,
          style: TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
            hintText: "Search",
          ),
          onFieldSubmitted: (searchLeague) {
            _countryLeagueBloc.fetchLeagues(searchLeague);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.countryName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        elevation: 0.0,
        bottom: PreferredSize(
          child: Container(
            height: 100,
            color: Colors.white,
            alignment: Alignment.center,
            child: searchBar(),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: StreamBuilder<Response<CountryLeaguesModel>>(
        stream: _countryLeagueBloc.leagueStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return Loading(loadingMessage: snapshot.data.message);
                break;
              case Status.COMPLETED:

                // if there are no leagues
                if (snapshot.data.data.countrys == null) {
                  return Center(
                    child: Text(
                      "No such leagues found. Please enter correct search term.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 18.0),
                    ),
                  );
                }
                return LeagueList(leagueList: snapshot.data.data);
                break;
              case Status.ERROR:
                return Error(
                  errorMessage: snapshot.data.message,
                  onRetryPressed: () => _countryLeagueBloc.fetchLeagues(""),
                );
                break;
            }
          }
          return Container();
        },
      ),
    );
  }
}
