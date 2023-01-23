import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif_flutter/main.dart';
import 'package:qualif_flutter/model/comment.dart';
import 'package:qualif_flutter/model/people.dart';

TextEditingController commentController = TextEditingController();

class DetailPage extends StatefulWidget {
  final People people;
  final String username;
  final Tinder tinder;
  const DetailPage({super.key, required this.people, required this.username, required this.tinder});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    void printComments(){

      int index = widget.tinder.people.indexWhere((element) => element.image == widget.people.image);

      for (Comment s in widget.tinder.people[index].comments) {
        print(s.comment);
      }
    }

    void handleAddComment(comment) {
      // String comment = commentController.text;

      print(widget.people.comments.length);
      printComments();

      if (comment.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Comment cannot be empty"),
          ),
        );
      } else {
        setState(() {
          int index = widget.tinder.people.indexWhere((element) => element.image == widget.people.image);
          // widget.people.comments.add(
          //     Comment(username: widget.username, comment: commentController.text));
          widget.tinder.people[index].comments.add(
              Comment(username: widget.username, comment: commentController.text));
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Comment added"),
          ),
        );
        // print("masuk");
      }

      commentController.text = "";
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
                                  controller: commentController,
                                  decoration: const InputDecoration(
                                      hintText: "Add Comment",
                                      fillColor: Colors.white,
                                      border: InputBorder.none),
                                  onSubmitted: (value) {
                                    handleAddComment(value);
                                    // print()
                                  },
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   child: Column(
                //     children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(10.0),
                        // constraints: const BoxConstraints.expand(),
                        child: Column(
                          children: [
                            const Text("Comments"),
                            const SizedBox(height: 10.0),
                            // Container(
                            //     child: Expanded(
                            //     child: ListView.builder(
                            //       shrinkWrap: true,
                            //       itemCount: widget.people.comments.length,
                            //       itemBuilder: ((context, index) {
                            //         return Padding(
                            //           padding: const EdgeInsets.all(8),
                            //           child: Column(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.start,
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [ 
                            //               Text(
                            //                   widget.people.comments[index].comment),
                            //               Text(
                            //                   "Sent by: ${widget.people.comments[index].username}")
                            //             ],
                            //           ),
                            //         );
                            //       }),
                            //     ),
                            //     ),
                            //     )

                            Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.people.comments.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [ 
                                          Text(
                                              widget.people.comments[index].comment),
                                          Text(
                                              "Sent by: ${widget.people.comments[index].username}")
                                        ],
                                      ),
                                    );
                                    },
                                ),
                            ),
                            
                            TextField(
                              onSubmitted: (value) {
                                handleAddComment(value);
                              },
                              controller: commentController,
                              decoration: const InputDecoration(
                                  hintText: "Add Comment",
                                  fillColor: Colors.white,
                                  border: InputBorder.none),
                            )
                          ],
                        ),
                      ),
                    // ],
                  // ),
                  // child: Text("data"),
                // ),
              ],
            )));
  }
}
