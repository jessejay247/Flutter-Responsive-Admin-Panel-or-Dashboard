import 'package:admin/backend/backend_repo.dart';
import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatefulWidget {
  const NewsContainer({
    Key key,
    // this.desc,
    // this.imageUrl,
    // this.source,
    // this.title,
    // this.url,
  }) : super(key: key);

  // final String title;
  // final String desc;
  // final String source;
  // final String url;
  // final String imageUrl;

  @override
  _NewsContainerState createState() => _NewsContainerState();
}

Repos _repos = Repos();

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _repos.getNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            var dats = snapshot.data
                .where((c) => c["category"] == "business")
                .toList();
            return Container(
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dats[0]["headline"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                    // padding: EdgeInsets.all(defaultPadding * 0.75),
                    height: 400,
                    // width: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      // height: ,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: dats[0]["image"] != null
                            ? NetworkImage(dats[0]["image"])
                            : AssetImage("assets/images/no-photo.png"),
                        fit: dats[0]["image"] != null
                            ? BoxFit.cover
                            : BoxFit.none,
                      )),
                    ),
                  ),
                  Text(
                    dats[0]["summary"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => launchURL(
                          dats[0]["url"],
                        ),
                        child: Text(
                          "Learn More",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white70),
                        ),
                      ),
                      Text(
                        dats[0]["source"],
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        });
  }

  launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
