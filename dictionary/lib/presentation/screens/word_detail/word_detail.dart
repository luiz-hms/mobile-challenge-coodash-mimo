import 'package:dictionary/data/models/api_dictionary_models.dart';
import 'package:dictionary/presentation/widgets/audio_player/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../services/api.dart';

class WordDetail extends StatefulWidget {
  //final String palavra;
  //WordDetail({super.key});
  //WordDetail(this.palavra, {super.key});
  const WordDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordDetailState createState() => _WordDetailState();
}

class _WordDetailState extends State<WordDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: FutureBuilder<List<ApiDictionaryModels>>(
        future: ApiService().fetchWordDetails(args.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Lottie.asset('assets/404.json', height: 400, width: 300),
                  Text('Palavra não encontrada'),
                ],
              ),
            );
          }
          final data = snapshot.data!;
          final wordDetails = data.first;
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
                CustomAudio(
                  urlAudio:
                      wordDetails.phonetics
                          .firstWhere((p) => p.audio!.isNotEmpty)
                          .toString(),
                ),
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
