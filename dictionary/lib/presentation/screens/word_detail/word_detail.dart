import 'package:dictionary/data/models/api_dictionary_models.dart';
import 'package:dictionary/presentation/widgets/audio_player/audio_player.dart';
import 'package:flutter/material.dart';
import '../../../services/api.dart';

class WordDetail extends StatefulWidget {
  //final String palavra;
  WordDetail({super.key});
  //WordDetail(this.palavra, {super.key});
  //const WordDetail({Key? key, required this.palavra}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordDetailState createState() => _WordDetailState();
}

class _WordDetailState extends State<WordDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: FutureBuilder<List<ApiDictionaryModels>>(
        future: ApiService().fetchWordDetails('love'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading details'));
          }
          final data = snapshot.data!;
          final wordDetails = data.first;
          /*
          setState(() {
            urlAudio = wordDetails.phonetics.first.audio.toString();
          });
          */
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Text(
                          wordDetails.word,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${wordDetails.phonetics.first.text}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomAudio(),
                /*
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(formatDuration(position)),
                    Slider(
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: handleSeek,
                    ),
                    Text(formatDuration(duration)),
                    IconButton(
                      onPressed: handlePause,
                      icon: Icon(
                        player.playing ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                  ],
                ),*/
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'meanings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      'verb - ${wordDetails.meanings.first.definitions.first.definition}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
