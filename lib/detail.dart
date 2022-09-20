import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/model/comment.dart';
import 'package:qualif_flutter/model/people.dart';

List<String> comment = [];

TextEditingController chatController = TextEditingController();

class DetailPage extends StatefulWidget {
  final People people;
  final String username;
  const DetailPage({super.key, required this.people, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    void handleAddComment() {
      String comment = chatController.text;

      if (comment.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Comment cannot be empty"),
          ),
        );
      } else {
        setState(() {
          widget.people.comments.add(
              Comment(username: widget.username, comment: chatController.text));
        });

        print("masuk");
      }
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Detail"),
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.crop_landscape_rounded),
                ),
                Tab(
                  icon: Icon(Icons.comment),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 300,
                        child: Image.asset(
                          widget.people.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                            // width: size.width * 0.8,
                            // height: 74,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.people.name,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  widget.people.description,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextField(
                                  controller: chatController,
                                  decoration: const InputDecoration(
                                      hintText: "Chat",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none),
                                  onSubmitted: (value) {
                                    handleAddComment();
                                    // print()
                                  },
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        // constraints: const BoxConstraints.expand(),
                        child: Column(
                          children: [
                            const Text("Chat"),
                            const SizedBox(height: 10.0),
                            Container(
                                // child: Expanded(
                                // child: ListView.builder(
                                //   itemCount: widget.people.comments.length,
                                //   itemBuilder: ((context, index) {
                                //     return Padding(
                                //       padding: const EdgeInsets.all(8),
                                //       child: Column(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.start,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Text(widget.people
                                //               .comments[index].comment),
                                //           Text(
                                //               "Sent by: ${widget.people.comments[index].username}")
                                //         ],
                                //       ),
                                //     );
                                //   }),
                                // ),
                                // ),
                                )
                          ],
                        ),
                      ),
                      TextField(
                        onSubmitted: (value) {
                          handleAddComment();
                        },
                        controller: chatController,
                        decoration: const InputDecoration(
                            hintText: "Chat",
                            // filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none),
                      )
                    ],
                  ),
                  // child: Text("data"),
                ),
              ],
            )));
  }
}
