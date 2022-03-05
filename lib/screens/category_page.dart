import 'package:blog_minimal/model/post_model.dart';
import 'package:blog_minimal/modules/home/controller/home_controller.dart';
import 'package:blog_minimal/screens/post_details_page.dart';
import 'package:blog_minimal/screens/post_editor.dart';
import 'package:blog_minimal/screens/user_profile.dart';
import 'package:blog_minimal/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<AppProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Category Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 12),
        //     child: InkWell(
        //       child: CircleAvatar(
        //         backgroundImage: AssetImage('assets/images/profile.jpg'),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => EditProfilePage(),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        //   // Padding(
        //   //   padding: const EdgeInsets.symmetric(horizontal: 8),
        //   //   child: InkWell(
        //   //     child: Stack(
        //   //       alignment: Alignment.center,
        //   //       children: [
        //   //         CircleAvatar(
        //   //           backgroundColor: Colors.grey[200],
        //   //           child: Icon(
        //   //             Icons.notifications_outlined,
        //   //             color: Colors.grey,
        //   //           ),
        //   //         ),
        //   //         Positioned(
        //   //           top: 6,
        //   //           right: 0,
        //   //           child: CircleAvatar(
        //   //             radius: 5,
        //   //             backgroundColor: Colors.red,
        //   //           ),
        //   //         )
        //   //       ],
        //   //     ),
        //   //   ),
        //   // )
        // ],
      ),
      // bottomNavigationBar: BottomBarWidget(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: Icon(Icons.add),
      //   label: Text("Add Post"),
      //   // backgroundColor: Color(0xFFFFD810),
      //   // elevation: 0,
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => PostEditor()));
      //   },
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/writing_1.jpg"),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'A contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
                          style: GoogleFonts.notoSerif(
                            color: Colors.black,
                            fontSize: 14,
                            height: 1.7,
                            wordSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: ChoiceChip(
                          label: Text("Hello"),
                          selected: index == 0,
                          onSelected: (bool value) {
                            // isSelected = !isSelected;
                          },
                          // pressElevation: 20,
                          // backgroundColor: Colors.lightBlue,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Snippets',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FutureBuilder<List<Post>>(
                    future: homeProvider.getAllSnippet(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      else if (snapshot.connectionState ==
                              ConnectionState.done &&
                          snapshot.hasData) {
                        final data = snapshot.data ?? [];

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final post = data[index];
                            return PostCellWidget(
                                title: post.title,
                                image: post.image,
                                author: post.author?.name,
                                date: post.date,
                                onClick: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => PostDetailsPage(
                                        title: post.title ?? "",
                                        image: post.image ?? "",
                                        author: post.author?.name ?? "",
                                        date: post.date ?? "",
                                      ),
                                    ),
                                  );
                                });
                          },
                          separatorBuilder: (context, index) => Divider(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
