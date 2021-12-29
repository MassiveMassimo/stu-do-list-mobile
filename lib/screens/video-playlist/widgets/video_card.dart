import 'package:flutter/material.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key}) : super(key: key);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.black,
        child: SizedBox(
          width: 420,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    "assets/images/lofi_studying.gif",
                    fit: BoxFit.cover,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
