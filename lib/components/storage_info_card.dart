import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    Key key,
    @required this.title,
    @required this.svgSrc,
    // @required this.amountOfFiles,
    @required this.numOfFiles,
    this.isRefered,
  }) : super(key: key);

  final String title, svgSrc;
  //  amountOfFiles;
  final int numOfFiles;

  final bool isRefered;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: Theme.of(context).primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              svgSrc,
              // color: Colors.white54,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    isRefered == true
                        ? "$numOfFiles referred"
                        : "USD $numOfFiles",
                    style: Theme.of(context).textTheme.caption.copyWith(
                        // color: Colors.white70
                        ),
                  ),
                ],
              ),
            ),
          ),
          // Text(amountOfFiles)
        ],
      ),
    );
  }
}
