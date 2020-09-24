import 'package:TheSportsDB/networking/league_api_provider.dart';
import 'package:TheSportsDB/models/country_leagues.dart';
import 'dart:async';

class CountryLeagueRepository {
  CountryLeaguesModel countryLeaguesModel;
  LeagueApiProvider _provider = LeagueApiProvider();
  Map<String, String> data;


  // This function maps the data
  Map<String, String> mapSportsData(List sportsData) {
    Map<String, String> tempData = {};
    sportsData.forEach((element) {
      tempData[element['strSport']] = element['strSportThumb'];
    });
    
    return tempData;
  }


  Future<CountryLeaguesModel> fetchCountryLeagueData(
      String country, String searchLeague) async {

    String leagueUrl = searchLeague != ""
        ? "/api/v1/json/1/search_all_leagues.php?c=$country&s=$searchLeague"
        : "/api/v1/json/1/search_all_leagues.php?c=$country";

    String allSportsUrl = "/api/v1/json/1/all_sports.php";

    final leagueResponse = await _provider.getLeagues(leagueUrl);
    final sportsResponse = await _provider.getAllSports(allSportsUrl);

    data = mapSportsData(sportsResponse['sports']);
    countryLeaguesModel = CountryLeaguesModel.fromJson(leagueResponse);
    countryLeaguesModel.allSportsData = data;

    return countryLeaguesModel;
  }
}
