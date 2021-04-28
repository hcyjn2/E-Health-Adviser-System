import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

/*
This class is used to display a control button and start an audio from assets, provided by assetsAudioPath
When a button is clicked it pauses/resumes the audio playing.
 */
class HelpAudioPlayer extends StatefulWidget {
  final String assetsAudioPath;

  HelpAudioPlayer({
    Key key,
    @required this.assetsAudioPath,
  }) : assert(assetsAudioPath != null);
  @override
  _HelpAudioPlayerState createState() => _HelpAudioPlayerState();
}

class _HelpAudioPlayerState extends State<HelpAudioPlayer> {
  //audio cache, used to preload a song into the cache before playing
  static AudioCache _cache;

  //Audio player handler
  AudioPlayer _player;

  //Flag that indicates if the audio is playing
  bool _isPlaying = true;

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

  //Disposing the cache to free up resources
  @override
  void dispose() {
    if (_player != null) _player.stop();
    _cache.clearCache();
    _player.dispose();
    super.dispose();
  }

  //This function pauses or resumes the audio based on isPlaying flag
  void playHandler() async {
    if (_isPlaying) {
      if (_player != null) _player.pause();
    } else {
      _player.resume();
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void precache() async {
    _player = AudioPlayer();
    _cache = new AudioCache(fixedPlayer: _player);
    //Precaching the audio from assets
    await _cache.load(widget.assetsAudioPath);
    //Start playing an audio in the loop and provide the handle to audio player handler
    _player = await _cache.loop(widget.assetsAudioPath);
  }
}
