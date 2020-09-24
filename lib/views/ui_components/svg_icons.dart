import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';


// launching the url
_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// icons
Widget svgIcons({String facebook, String twitter}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
    child: Row(
      children: <Widget>[
        Container(
          width: 35,
          height: 35,
          child: twitter != null
              ? InkWell(
                  onTap: () {
                    if (twitter.contains("http")) {
                      _launchURL(twitter);
                    } else {
                      _launchURL("https://" + twitter);
                    }
                  },
                  child: SvgPicture.asset(
                    "assets/icons/twitter.svg",
                    color: Colors.white,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          width: 35,
          height: 35,
          child: facebook != null
              ? InkWell(
                  onTap: () {
                    if (facebook.contains("http")) {
                      _launchURL(facebook);
                    } else {
                      _launchURL("https://" + facebook);
                    }
                  },
                  child: SvgPicture.asset(
                    "assets/icons/facebook.svg",
                    color: Colors.white,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ))
              : Container(),
        ),
      ],
    ),
  );
}
