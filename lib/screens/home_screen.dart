import 'package:flutter/material.dart';
import 'package:song_webtoon/models/webtoon.dart';
import 'package:song_webtoon/services/api_service.dart';
import 'package:song_webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysTonns();

  // List<WebtoonModel> webtoons = [];
  @override
  Widget build(BuildContext context) {
    // print(webtoons);
    // print(isLoding);
    // print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          " Today's 웹툰 ",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );

            // return makeList(snapshot);
          }
          // if (snapshot.hasData) {
          //   return ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: snapshot.data!.length,
          //     itemBuilder: (context, index) {
          //       print(index);
          //       var webtoon = snapshot.data![index];
          //       return Text(webtoon.title);
          //     },
          //     // children: [
          //     //   for (var webtoon in snapshot.data!) Text(webtoon.title)
          //     // ],
          //   );
          // }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        print(index);
        var webtoon = snapshot.data![index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
        // return Column(
        //   children: [
        //     Container(
        //       width: 250,
        //       clipBehavior: Clip.hardEdge,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(20),
        //         boxShadow: [
        //           BoxShadow(
        //             blurRadius: 15,
        //             offset: const Offset(10, 10),
        //             color: Colors.black.withOpacity(0.5),
        //           )
        //         ],
        //       ),
        //       child: Image.network(
        //         webtoon.thumb,
        //         headers: const {
        //           "User-Agent":
        //               "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        //         },
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 10,
        //     ),
        //     Text(
        //       webtoon.title,
        //       style: const TextStyle(
        //         fontSize: 22,
        //       ),
        //     ),
        //   ],
        // );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
      // children: [
      //   for (var webtoon in snapshot.data!) Text(webtoon.title)
      // ],
    );
  }
}
