import 'package:flutter/material.dart';

import '../../home/homestyles.dart';

class DetContent extends StatefulWidget {
  final AsyncSnapshot data;

  const DetContent({Key? key, required this.data}) : super(key: key);

  @override
  State<DetContent> createState() => _DetContentState();
}

class _DetContentState extends State<DetContent>
    with AutomaticKeepAliveClientMixin {
  var theme = HomeStyles();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: widget.data.data["forecast"]["forecastday"].length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.32,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.black,
                image: const DecorationImage(
                    image: AssetImage("assets/images/1.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.5),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(14.0)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                            "Date : ${widget.data.data["forecast"]["forecastday"][index]["date"]}",
                            style: theme.primaryText()),
                      ),
                      Flexible(
                        child: Text(
                            "Condition : ${widget.data.data["forecast"]["forecastday"][index]["day"]["condition"]["text"]}",
                            style: theme.primaryText()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Image.network(
                    "http:${widget.data.data["forecast"]["forecastday"][index]["day"]["condition"]["icon"]}",
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                            "Humidity : ${widget.data.data["forecast"]["forecastday"][index]["day"]["avghumidity"]}",
                            style: theme.primaryText()),
                      ),
                      Flexible(
                        child: Text(
                            "Max Today : ${widget.data.data["forecast"]["forecastday"][index]["day"]["maxtemp_c"]} C / ${widget.data.data["forecast"]["forecastday"][index]["day"]["maxtemp_f"]} F",
                            style: theme.primaryText()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
