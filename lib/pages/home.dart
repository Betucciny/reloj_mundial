import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check if arguments is not null before casting it to a Map
    if (ModalRoute.of(context)?.settings.arguments != null) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'url': result['url'],
                        'time': result['time'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                    },
                  icon: Icon(
                      Icons.edit_location,
                      color: textColor,
                  ),
                  label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: textColor,
                      ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 66.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage("assets/${data['flag']}"),
                  ),
                )
              ]
            )
          ),
        )
      )
    );
  }
}
