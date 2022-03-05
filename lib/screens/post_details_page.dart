import 'package:clipboard/clipboard.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class PostDetailsPage extends StatefulWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  PostDetailsPage({
    required this.title,
    required this.image,
    required this.author,
    required this.date,
  });

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late CodeController _codeController;

  final source = """
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}""";

  final preset = <String>[
    "dart|monokai-sublime",
    "python|atom-one-dark",
    "cpp|an-old-hope",
    "java|a11y-dark",
    "javascript|vs",
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _codeController = CodeController(
      text: source,
      language: dart,
      theme: monokaiSublimeTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8),
          //     child: Container(
          //       color: Colors.grey[200],
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.bookmark_outline,
          //           size: 20,
          //         ),
          //         color: Colors.grey,
          //         onPressed: () {},
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8),
          //     child: Container(
          //       color: Colors.grey[200],
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.favorite_outline,
          //           size: 20,
          //         ),
          //         color: Colors.grey,
          //         onPressed: () {},
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.share_outlined,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionBubble(
        animation: _animation,
        items: [
          Bubble(
            title: "30 Beers",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.wine_bar,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              // Navigator.push(
              //     context,
              //     new MaterialPageRoute(
              //         builder: (BuildContext context) => Homepage()),

              //         );
              // _animationController.reverse();
            },
          ),
          Bubble(
            title: "20 Beers",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.wine_bar,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              // _animationController.reverse();
            },
          ),
          // Floating action menu item
          Bubble(
            title: "10 Beers",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.wine_bar,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              // _animationController.reverse();
            },
          ),
          //Floating action menu item
        ],
        iconColor: Colors.brown.shade900,
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),
        backGroundColor: Colors.yellow,
        // label: Text("Beers"),
        iconData: Icons.wine_bar,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ListView(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('${widget.author}, '),
                  Text(
                    widget.date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        '6.5K Views',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.wine_bar,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        '106 beers',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        '55 Saves',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(widget.image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      FlutterClipboard.copy(source).then((result) {
                        final snackBar = SnackBar(
                          content: Text('Copied to Clipboard'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Text("Copy"),
                  )
                ],
              ),
              Card(
                clipBehavior: Clip.hardEdge,
                child: CodeField(
                  controller: _codeController,
                  textStyle: TextStyle(fontFamily: 'SourceCode'),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'A',
                        style: GoogleFonts.notoSerif(
                            color: Colors.black, fontSize: 32)),
                    TextSpan(
                      text:
                          ' contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 18,
                        height: 1.7,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
