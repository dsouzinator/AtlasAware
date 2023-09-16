import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: { // Add your routes here
        '/': (context) => const MyHomePage(title: 'Atlas Aware'),
        // '/destination': (context) => const WorldMapPage(title: 'Destination Page'),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
        body: Container(
          decoration: BoxDecoration( 
            image: DecorationImage(
              image: AssetImage("assets/images/BackgroundOption1WorldMap.png"),
              fit: BoxFit.cover,
              opacity: 0.8,
              filterQuality: FilterQuality.high
            ),

          ),
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Hello, what would you like to explore today?",
              style: TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
              textAlign: TextAlign.center,
              ),
              Container(
                width: 500,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your code here for the first button
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorldMapPage(
                        title:"Temperature"
                        )),
                    );
                  },
                  child: Text('Temperature',
                  style: 
                  TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 500,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your code here for the second button
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorldMapPage(
                        title:"Air Quality",
                      )),
                    );
                  },
                  child: 
                  Text(
                  'Air Quality ',
                  style: 
                  TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 500,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your code here for the third button
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorldMapPage(
                        title:"Forest Cover",
                      )),
                    );
                  },
                  child: Text('Forest Cover',
                  style: 
                  TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}

class WorldMapPage extends StatelessWidget {
  final String title;
  const WorldMapPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Region'),
      ),
      body: Container(
        // child: Column(          
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        child: _SomeContainer(title: title),

        // ],
        //)

      ),
    );
  }
}

class _SomeContainer extends StatelessWidget {
  const _SomeContainer({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: PhotoView(
        imageProvider: AssetImage('assets/images/world.png'), // Replace with your image asset path
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered,
        onTapUp: (context, details, controllerValue) {

          if ((details.globalPosition.dx<120) & (details.globalPosition.dx > 30) &
          (details.globalPosition.dy<600) & (details.globalPosition.dy>520) &
          (title=="Temperature"))
          {
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalMapPage(
                    title:title,
                    region:"Phoenix"
                  )),
              );
          }
          else if ((details.globalPosition.dx<560) & (details.globalPosition.dx > 500) &
          (details.globalPosition.dy<650) & (details.globalPosition.dy>580) &
          (title=="Temperature"))
          {
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalMapPage(
                    title:title,
                    region:"Mumbai"
                  )),
              );
          }
          else if ((details.globalPosition.dx<180) & (details.globalPosition.dx > 30) &
          (details.globalPosition.dy<480) & (details.globalPosition.dy>350) &
          (title=="Air Quality"))
          {
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalMapPage(
                    title:title,
                    region:"California"
                  )),
              );
          }
        },
      ),

    );
  }
}

class LocalMapPage extends StatefulWidget{
  final String title;
  final String region;
  const LocalMapPage({super.key, required this.title, required this.region});
  @override
  _LocalMapPageState createState() => _LocalMapPageState();

}

class _LocalMapPageState extends State<LocalMapPage>{


  double sliderValue = 0;
  String titlePath = "";
  double minVal = -40;
  double maxVal = 60;

  @override
  void initState() {
    super.initState();
    if((widget.title=="Temperature") & (widget.region=="Phoenix")){
      titlePath = 'PhoenixTempQuestion.png';

    }
    else if((widget.title=="Temperature") & (widget.region=="Mumbai")){
      titlePath = 'MumbaiTempQuestion.png';
    }
    else if((widget.title=="Air Quality") & (widget.region=="California")){
      titlePath = 'CaliCAQIQuestion.jpeg';
      minVal = 0;
      maxVal = 200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Guess the ${widget.title}',
        ),
      ),
      body: Container(
          decoration: BoxDecoration( 
            image: DecorationImage(
              image: AssetImage("assets/images/BackgroundOption2.png"),
              fit: BoxFit.cover,
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Guess the predominant maximum ${widget.title.toLowerCase()} in and around ${widget.region}!',
              style: TextStyle(fontSize: 40,
              color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            // SizedBox(height: 16),
            Image.asset(
              'assets/images/${titlePath}', // Replace with your image asset path
              width: 700, // Adjust image size as needed
              height: 700,
            ),
            SizedBox(height: 16),
            Text(
              '${widget.title} : ${sliderValue.toStringAsFixed(2)} ${widget.title=="Temperature"?"°C":"CAQI"}',
              style: TextStyle(fontSize: 18,
              color: Colors.white),
            ),
            Slider(
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
              min: minVal,
              max: maxVal,

              divisions: 100,
            ),
            // submitButton(),
            Container(
                width: 500,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your code here for the third button
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultPage(
                        title:widget.title,
                        region:widget.region,
                        value:sliderValue,
                      )),
                    );
                  },
                  child: Text('Submit',
                  style: 
                  TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ],
        ),
      ),

      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String title;
  final String region;
  final double value;
  const ResultPage({super.key, required this.title, required this.region, required this.value});

  @override
  Widget build(BuildContext context) {
    String titlePath = "";
    String message = "";
    if ((title=="Temperature") & (region=="Phoenix"))
    {
      if(value<32)
      {
        message = "This region is hotter than you think!";
      }
      else if(value>42)
      {
        message = "This region is cooler than you think!";
      }
      else
      {
        message = "You are right!";
      }
      titlePath = 'PhoenixTempTruth.png';

    }
    else if ((title=="Temperature") & (region=="Mumbai"))
    {
      if (value<24)
      {
        message = "This region is hotter than you think!";
      }
      else if (value>32)
      {
        message = "This region is cooler than you think!";
      }
      else
      {
        message = "You are right!";
      }
      titlePath = 'MumbaiTempTruth.png';

    }
    else if ((title=="Air Quality") & (region=="California"))
    {
      if (value<75)
      {
        message = "This region is more polluted than you think!";
      }
      else if (value>100)
      {
        message = "This region is less polluted than you think!";
      }
      else
      {
        message = "You are right! ";
      }
      titlePath = 'CaliCAQITruth.jpeg';

    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Container(
          decoration: BoxDecoration( 
            image: DecorationImage(
              image: AssetImage("assets/images/BackgroundOption2.png"),
              fit: BoxFit.fill,
            ),
          ),
      child:Center(

        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(fontSize: 40,
              color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/${titlePath}', // Replace with your image asset path
              width: 700, // Adjust image size as needed
              height: 700,
            ),
            Container(
                width: 500,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your code here for the third button
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(
                        title:"Home Page"
                      )),
                    );
                  },
                  child: Text('Go to Home Page',
                  style: 
                  TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ]
        ),
      ),
      ),
      ),
    );
  }
}


