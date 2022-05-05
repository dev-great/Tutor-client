import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutor/states/feedstate.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding =
          await Provider.of<FeedState>(context, listen: false).getFeeds();
      _isLoding =
          await Provider.of<FeedState>(context, listen: false).getFeedVideo();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final feeds = Provider.of<FeedState>(context, listen: false).feeds;
    final feedvideo = Provider.of<FeedState>(context, listen: false).feedvideo;
    int lnt = feeds.length;
    if (!_isLoding) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Feeds",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 32,
                          color: Color.fromARGB(255, 0, 39, 75),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Welcome, Greatness!",
                        style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontSize: 17,
                            color:
                                Color.fromARGB(255, 0, 39, 75).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              const Center(
                child: Image(image: AssetImage("assets/images/connecting.gif")),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold();
    }
  }
}
