// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../homestyles.dart';

class futureCont extends StatefulWidget {
  final AsyncSnapshot snapshot;
  const futureCont({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<futureCont> createState() => _futureContState();
}

class _futureContState extends State<futureCont> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = HomeStyles();
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "${widget.snapshot.data["location"]["name"]} , ",
                  style: theme.headingText(),
                ),
              ),
              Flexible(
                child: Text(widget.snapshot.data["location"]["country"],
                    style: theme.headingText()),
              ),
            ],
          ),
          Container(
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
                            "Today's Temp : ${widget.snapshot.data["current"]["temp_c"]} C / ${widget.snapshot.data["current"]["temp_f"]} F ",
                            style: theme.primaryText()),
                      ),
                      Flexible(
                        child: Text(
                            "Condition : ${widget.snapshot.data["current"]["condition"]["text"]}",
                            style: theme.primaryText()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Image.network(
                    "http:${widget.snapshot.data["current"]["condition"]["icon"]}",
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
                            "Humidity : ${widget.snapshot.data["current"]["humidity"]}",
                            style: theme.primaryText()),
                      ),
                      Flexible(
                        child: Text(
                            "Feels Like : ${widget.snapshot.data["current"]["feelslike_c"]} C / ${widget.snapshot.data["current"]["feelslike_f"]} F ",
                            style: theme.primaryText()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Other Details : ", style: theme.headingText()),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                            "Wind Speed : ${widget.snapshot.data["current"]["wind_mph"]} MPH / ${widget.snapshot.data["current"]["wind_kph"]} KPH ",
                            style: theme.primaryText()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                            "Wind Degree : ${widget.snapshot.data["current"]["wind_degree"]}",
                            style: theme.primaryText()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                            "Wind Direction : ${widget.snapshot.data["current"]["wind_dir"]}",
                            style: theme.primaryText()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                            "Precipation : ${widget.snapshot.data["current"]["precip_mm"]} mm / ${widget.snapshot.data["current"]["precip_in"]} in ",
                            style: theme.primaryText()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                            "Gust Speed : ${widget.snapshot.data["current"]["gust_mph"]} MPH / ${widget.snapshot.data["current"]["gust_kph"]} KPH ",
                            style: theme.primaryText()),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
