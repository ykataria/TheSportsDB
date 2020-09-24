import 'package:flutter/material.dart';
import 'package:TheSportsDB/models/country_leagues.dart';

import '../ui_components/svg_icons.dart';

// component for showing the leagues
class LeagueList extends StatelessWidget {
  final CountryLeaguesModel leagueList;

  const LeagueList({Key key, this.leagueList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            leagueList.allSportsData[
                                leagueList.countrys[index].strSport],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    leagueList.countrys[index].strLeague,
                                    overflow: TextOverflow.fade,
                                    softWrap: true,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              svgIcons(
                                  facebook:
                                      leagueList.countrys[index].strFacebook,
                                  twitter:
                                      leagueList.countrys[index].strTwitter)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 20, 10, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                leagueList.countrys[index].strLogo == null
                                    ? Container()
                                    : Container(
                                        width: 100,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              leagueList
                                                  .countrys[index].strLogo,
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: leagueList.countrys.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}
