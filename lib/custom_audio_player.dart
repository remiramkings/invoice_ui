import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ui_project/service/audio_player_service.dart';


class CustomAudioPlayer extends StatefulWidget {
  String filePath;
  Function(Future<Duration?>?, AudioPlayerService service)? onDurationFuture;

  CustomAudioPlayer({super.key, required this.filePath, this.onDurationFuture});

  @override
  State<StatefulWidget> createState() {
    return CustomAudioPlayerState();
  }
}

class CustomAudioPlayerState extends State<CustomAudioPlayer> {
  AudioPlayerService audioService = AudioPlayerService.getInstance();

  Future<Duration?>? filePathFuture;
  Stream<Duration?>? progressStream;
  Stream<PlayerState>? playerStateStream;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  initializePlayer() async {
    progressStream = audioService.getProgressStream();
    filePathFuture = audioService.setFilePath(widget.filePath);
    playerStateStream = audioService.player?.playerStateStream;
    if(widget.onDurationFuture != null){
      Duration? d = await filePathFuture;
      filePathFuture = Future.value(d);
      widget.onDurationFuture!(Future.value(d), audioService);
    }
  }

  getFileNameFromPath() {
    return widget.filePath.split("/").last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: FutureBuilder<Duration?>(
        future: filePathFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator.adaptive()
              ),
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: const Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Text("${getFileNameFromPath()}"),
              const SizedBox(height: 15),
              StreamBuilder<Duration?>(
                stream: progressStream,
                builder: (context, streamSnap) {
                  Duration current = (streamSnap.data != null) ? streamSnap.data! : const Duration(seconds: 0);
                  Duration total = audioService
                    .player!
                    .duration ?? const Duration(seconds: 0);
                  return ProgressBar(
                    progress: current,
                    total: total,
                    onSeek: (duration) {
                      audioService
                        .player!
                        .seek(duration);
                    },
                  );
                },
              ),
              StreamBuilder<PlayerState>(
                stream: playerStateStream,
                builder: (context, playerStateSnapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (playerStateSnapshot.data != null
                        && playerStateSnapshot.data!.playing
                        && (playerStateSnapshot.data!.processingState == ProcessingState.loading
                          || playerStateSnapshot.data!.processingState == ProcessingState.ready))
                          ? InkWell(
                              child: const Icon(
                                Icons.pause,
                                size: 45,
                              ),
                              onTap: () {
                                audioService
                                  .player!
                                  .pause()
                                  .then((value) => {

                                  });
                              },
                            )
                          : InkWell(
                              child: const Icon(Icons.play_circle, size: 45),
                              onTap: () {
                                if(!playerStateSnapshot.data!.playing
                                  && playerStateSnapshot.data!.processingState == ProcessingState.ready)
                                {
                                  audioService
                                    .play();
                                    return;
                                }
                                audioService
                                      .player!
                                      .seek(const Duration(seconds: 0))
                                      .then((value) => {
                                        audioService
                                          .play()
                                      });
                                
                              },
                            )
                    ],
                  );
                }
              )
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    if(
      audioService.player != null
      && audioService.player!.playing){
        audioService
          .player!
          .dispose();
      }
    super.dispose();
  }
}
