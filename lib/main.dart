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
  int _selectedIndex = 0;


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
        bottomNavigationBar: BottomNavigationBar(
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "Leaderboard"),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 0){
                    MyHomePage(
                        title:"Home Page"
                    );
            }
            else if (index == 1){
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LeaderboardPage(
                      )),
                    );
            }
          },
          ),
    );
  }
}


class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Column(
        children: [
          // Heading row with columns: User ID, Score, Rank
          Container(
            color: Colors.blue, // Background color for the heading row
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text('     ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text('User ID', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Streak(Days)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
          // List of leaderboard entries
          LeaderboardEntry(rank: 1, userId: 'agatha', score: 10),
          LeaderboardEntry(rank: 2, userId: 'martin', score: 8),
          LeaderboardEntry(rank: 3, userId: 'joanne', score: 7),
          LeaderboardEntry(rank: 4, userId: 'tommy', score: 7),
          LeaderboardEntry(rank: 5, userId: 'harry', score: 5),
          LeaderboardEntry(rank: 6, userId: 'finn', score: 3),

        ],
      ),
    );
  }
}

class LeaderboardEntry extends StatelessWidget {
  final int rank;
  final String userId;
  final int score;

  LeaderboardEntry({required this.rank, required this.userId, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: rank % 2 == 0 ? Colors.white : Colors.grey[200], // Alternating row colors
      child: ListTile(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text('     ', style: TextStyle(color: Colors.black)),
                Text(userId, style: TextStyle(color: Colors.black)),
                Text(score.toString(), style: TextStyle(color: Colors.black)),
              ],
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
          else if ((details.globalPosition.dx<200) & (details.globalPosition.dx > 10) &
          (details.globalPosition.dy<550) & (details.globalPosition.dy>300) &
          (title=="Air Quality"))
          {
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalMapPage(
                    title:title,
                    region:"Orleans, California"
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
  String prompt = "";

  @override
  void initState() {
    super.initState();
    if((widget.title=="Temperature") & (widget.region=="Phoenix")){
      titlePath = 'PhoenixTempQuestion.png';
      prompt = 'Guess the predominant maximum ${widget.title.toLowerCase()} in and around ${widget.region}!';

    }
    else if((widget.title=="Temperature") & (widget.region=="Mumbai")){
      titlePath = 'MumbaiTempQuestion.png';
      prompt = 'Guess the predominant maximum ${widget.title.toLowerCase()} in and around ${widget.region}!';
    }
    else if((widget.title=="Air Quality") & (widget.region=="Orleans, California")){
      titlePath = 'CaliCAQIQuestion.jpeg';
      minVal = 0;
      maxVal = 200;
      prompt = 'Guess the current ${widget.title.toLowerCase()} CAQI in and around ${widget.region}!';
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
              prompt,
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
                width: 400,
                height: 50,
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
    String education = "";
    double height = 700;
    double width = 700;
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
      education = "Compared to neighboring states like California and Nevada, Phoenix, Arizona generally experiences hotter and drier weather, especially during the summer months. Fall in Phoenix is characterized by a gradual cooling from the scorching summer heat. But you can still expect high temperatures around 35°C-40°C.";

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
      education = "Despite being one of the busiest cities in India, Mumbai generally experiences more moderate weather due to its coastal location along the Arabian Sea. September starts with warm and humid conditions, with daytime highs ranging from 25°C to 30°C.";

    }
    else if ((title=="Air Quality") & (region=="Orleans, California"))
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
      education = "Orleans and neighboring areas have particularly poor air quality because of ongoing fires in the region. Such ‘unhealthy’ air quality makes groups like children, the elderly, pregnant people, and people with cardiac and pulmonary diseases particularly susceptible to health impacts. Residents are recommended to wear a mask, run an air purifier, keep windows closed to avoid dirty outdoor air, and avoid outdoor exercise.";
      height = 600;
      width = 600;
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
              width: width, // Adjust image size as needed
              height: height,

            ),
            Text(
              education,
              style: TextStyle(fontSize: 25,
              color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            Container(
                width: 400,
                height: 50,
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


