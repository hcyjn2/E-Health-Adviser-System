import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HelpAudioPlayer extends StatefulWidget {
  final String assetsAudioPath;

  HelpAudioPlayer({Key key, @required this.assetsAudioPath})
      : assert(assetsAudioPath != null);
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
    precache();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 10,
      onPressed: playHandler,
      child: Text(_isPlaying ? "Pause" : "Continue",
          style: TextStyle(fontSize: 20)),
    );
  }

  @override
  void dispose() {
    if (_player != null) _player.stop();
    _cache.clearCache();
    super.dispose();
  }

  void playHandler() async {
    if (_isPlaying) {
      if (_player != null) _player.stop();
    } else {
      _player = await _cache.play(widget.assetsAudioPath);
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void precache() async {
    await _cache.load(widget.assetsAudioPath);
    playHandler();
  }
}
