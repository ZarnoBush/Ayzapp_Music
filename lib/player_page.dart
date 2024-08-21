import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayPage extends StatefulWidget {
  PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('audio/GetTheGroove.mp3');
    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    },);

    // set a callback for position change
    player.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    },);
    // set a callback for when audio ends
    player.onPlayerComplete.listen((_) {
      setState(() {
        _position = _duration;
      });
    },);
  }

  void playPause() async{
    if(isPlaying){
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {
       
    });
  }

  // Future<void> _playAudio(String assetPath) async {
  //   print('before!!');
  //   await _audioPlayer.play(AssetSource(assetPath));
  //   print('after!!');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/play_img.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAppBar(),
                    Container(
                      color: const Color.fromARGB(14, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppBarIcon(
                                    iconData: Icons.shuffle,
                                    color: Colors.white),
                                AppBarIcon(
                                    iconData: Icons.skip_previous_rounded,
                                    color:
                                        const Color.fromARGB(255, 255, 230, 0)),
                                GestureDetector(
                                  onTap: () => playPause(),
                                  child: AppBarIcon(
                                      iconData: isPlaying ? Icons.pause_circle_filled_rounded : Icons.play_arrow_rounded,
                                      color: const Color.fromARGB(
                                          255, 0, 38, 255)),
                                ),
                                AppBarIcon(
                                    iconData: Icons.skip_next_rounded,
                                    color:
                                        const Color.fromARGB(255, 255, 230, 0)),
                                AppBarIcon(
                                    iconData: Icons.repeat,
                                    color: Colors.white),
                              ],
                            ),
                            TextHolder(
                              textHolder: 'Artist Name_',
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.maxFinite,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(136, 158, 158, 158),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MusicList(
                                      index: index,
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AppBarIcon(
                                          iconData: Icons.more_horiz_rounded,
                                          color: const Color.fromARGB(
                                              255, 0, 255, 8),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MusicList extends StatelessWidget {
  MusicList({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextHolder(
            textHolder: '${index + 1}',
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400)),
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                  image: AssetImage('assets/images/music_two.jpg'))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHolder(
                textHolder: 'Artist Name_',
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            TextHolder(
                textHolder: 'Song Name_',
                textStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
          ],
        ),
      ],
    );
  }
}

class TextHolder extends StatelessWidget {
  TextHolder({super.key, required this.textHolder, required this.textStyle});

  String textHolder;
  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textHolder,
      style: textStyle,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: GestureDetector(
              onTap: Get.back,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                AppBarIcon(
                  iconData: Icons.share,
                  color: const Color.fromARGB(255, 217, 0, 255),
                ),
                SizedBox(
                  width: 15,
                ),
                AppBarIcon(
                  iconData: Icons.favorite_outlined,
                  color: const Color.fromARGB(255, 255, 17, 0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  AppBarIcon({super.key, required this.iconData, required this.color});

  IconData iconData;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color,
    );
  }
}
