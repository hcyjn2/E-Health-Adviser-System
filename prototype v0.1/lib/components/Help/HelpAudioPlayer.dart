import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HelpAudioPlayer extends StatefulWidget {
  @override
  _HelpAudioPlayerState createState() => _HelpAudioPlayerState();
}

class _HelpAudioPlayerState extends State<HelpAudioPlayer> {
  static AudioCache _cache = new AudioCache();

  AudioPlayer _player;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    playHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        elevation: 10,
        onPressed: playHandler,
        child: Text(_isPlaying ? "Pause" : "Continue",
            style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  void deactivate() {
    _player.stop();
    _cache.clearCache();
    super.deactivate();
  }

  void playHandler() async {
    if (_isPlaying) {
      _player.stop();
    } else {
      _player = await _cache.play('audios/song1.mp3');
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }
}
