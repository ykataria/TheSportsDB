
// CountryLeaguesModel class
class CountryLeaguesModel {
  List<Countrys> countrys;
  Map<String,String> allSportsData;

  CountryLeaguesModel({this.countrys});

  CountryLeaguesModel.fromJson(Map<String, dynamic> json) {
    if (json['countrys'] != null) {
      countrys = new List<Countrys>();
      json['countrys'].forEach((v) {
        countrys.add(new Countrys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countrys != null) {
      data['countrys'] = this.countrys.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// countrys model class
class Countrys {
  String strCountry;
  String strLeague;
  String strLogo;
  String strTwitter;
  String strFacebook;
  String strSport;

  Countrys(
      {this.strCountry,
      this.strLeague,
      this.strLogo,
      this.strTwitter,
      this.strFacebook,
      this.strSport});

  Countrys.fromJson(Map<String, dynamic> json) {
    strCountry = json['strCountry'];
    strLeague = json['strLeague'];
    strLogo = json['strLogo'];
    strTwitter = json['strTwitter'];
    strFacebook = json['strFacebook'];
    strSport = json['strSport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strCountry'] = this.strCountry;
    data['strLeague'] = this.strLeague;
    data['strLogo'] = this.strLogo;
    data['strTwitter'] = this.strTwitter;
    data['strFacebook'] = this.strFacebook;
    data['strSport'] = this.strSport;
    return data;
  }
}
