import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool con = true;
  int audioNo = 0;
  
  // AUDIO
  List image = [
    'img1.jpg',
    'img2.jpg',
    'img3.jpg',
    'img4.jpg',
  ];
  List music = [
    'https://webtestingforme.000webhostapp.com/Mp3/audio1.mp3',
    'https://webtestingforme.000webhostapp.com/Mp3/audio2.mp3',
    'https://webtestingforme.000webhostapp.com/Mp3/audio3.mp3',
    'https://webtestingforme.000webhostapp.com/Mp3/audio4.mp3',
    ];

  // FOR AUDIO PLAY, PAUSE, SKIP AND BACK
  play() async {
    await audioPlayer.play(music[audioNo]);
  }
  pause() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 212, 9, 248),
              Color.fromARGB(255, 64, 165, 247)
            ]
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text('Mp3 Player', style: TextStyle(fontSize: 40, color: Colors.greenAccent),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: GlassContainer( //MAINIMAGE
                  height: 300,
                  width: 300,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.white.withOpacity(0.05),
                      Colors.white.withOpacity(0.60),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  blur: 10,
                  borderRadius: BorderRadius.circular(20.0),
                  borderWidth: 1.0,
                  elevation: 3.0,
                  isFrostedGlass: true,
                  shadowColor: const Color.fromARGB(255, 50, 131, 236).withOpacity(0.20),
                  child: Image(image: AssetImage('images/${image[audioNo]}')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassContainer( //BACKBUTTOM
                      height: 60,
                      width: 60,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.40),
                          Colors.white.withOpacity(0.10),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.60),
                          Colors.white.withOpacity(0.10),
                          Colors.white.withOpacity(0.05),
                          Colors.white.withOpacity(0.60),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.0, 0.39, 0.40, 1.0],
                      ),
                      blur: 10,
                      borderRadius: BorderRadius.circular(50.0),
                      borderWidth: 1.0,
                      elevation: 3.0,
                      isFrostedGlass: true,
                      shadowColor: const Color.fromARGB(255, 50, 131, 236).withOpacity(0.20),
                      child: IconButton(
                        onPressed: (){
                          if(audioNo == 0){
                            pause();
                            setState(() {
                              con = true;
                              audioNo = 3;
                            });
                          }else{
                            pause();
                            setState(() {
                              con = true;
                            audioNo -= 1;
                          });
                          }
                        },
                        icon: Icon(Icons.skip_previous), iconSize: 30.0,),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GlassContainer( //PLAYBUTTOM
                        height: 80,
                        width: 80,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.40),
                            Colors.white.withOpacity(0.10),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.60),
                            Colors.white.withOpacity(0.10),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.60),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: const [0.0, 0.39, 0.40, 1.0],
                        ),
                        blur: 10,
                        borderRadius: BorderRadius.circular(50.0),
                        borderWidth: 1.0,
                        elevation: 3.0,
                        isFrostedGlass: true,
                        shadowColor: const Color.fromARGB(255, 50, 131, 236).withOpacity(0.20),
                        child: IconButton(
                          onPressed: (){
                            if(con){
                              play();
                            }else{
                              pause();
                            }
                            setState(() {
                              con = !con;
                            });
                          },
                          icon: con ?  const Icon(Icons.play_arrow) : const Icon(Icons.pause), color: Colors.greenAccent, iconSize: 40.0,),
                        ),
                    ),
                    GlassContainer( //NEXTBUTTOM
                      height: 60,
                      width: 60,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.40),
                          Colors.white.withOpacity(0.10),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.60),
                          Colors.white.withOpacity(0.10),
                          Colors.white.withOpacity(0.05),
                          Colors.white.withOpacity(0.60),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.0, 0.39, 0.40, 1.0],
                      ),
                      blur: 10,
                      borderRadius: BorderRadius.circular(50.0),
                      borderWidth: 1.0,
                      elevation: 3.0,
                      isFrostedGlass: true,
                      shadowColor: const Color.fromARGB(255, 50, 131, 236).withOpacity(0.20),
                      child: IconButton(
                        onPressed: (){
                          if(audioNo == 3){
                            pause();
                            setState(() {
                              con = true;
                              audioNo = 0;
                            });
                          }else{
                            pause();
                            setState(() {
                              con = true;
                            audioNo += 1;
                          });
                          }
                        },
                        icon: const Icon(Icons.skip_next), iconSize: 30.0,),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}