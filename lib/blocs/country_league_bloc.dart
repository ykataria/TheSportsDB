import 'dart:async';

import 'package:TheSportsDB/networking/response.dart';
import 'package:TheSportsDB/repository/country_league_repo.dart';
import 'package:TheSportsDB/models/country_leagues.dart';


// bloc for countryLeagues
class CountryLeagueBloc {
  String country;
  CountryLeagueRepository _leagueRepository;
  StreamController _leagueController;

  StreamSink<Response<CountryLeaguesModel>> get leagueSink =>
      _leagueController.sink;

  Stream<Response<CountryLeaguesModel>> get leagueStream =>
      _leagueController.stream;

  CountryLeagueBloc(String country) {
    this.country = country;
    _leagueController = StreamController<Response<CountryLeaguesModel>>();
    _leagueRepository = CountryLeagueRepository();

    // call the repo function to call API
    fetchLeagues("");
  }

  // function for calling API through repository
  fetchLeagues(String searchLeague) async {
    // on loading Loading
    leagueSink.add(Response.loading('Getting Leagues'));
    try {
      CountryLeaguesModel countryLeagues =
          await _leagueRepository.fetchCountryLeagueData(country, searchLeague);

      // on request complete
      leagueSink.add(Response.completed(countryLeagues));
    } catch (e) {
      // on error
      leagueSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    // close the stream controller if not closed
    _leagueController?.close();
  }
}
