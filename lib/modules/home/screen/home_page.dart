import 'package:blog_minimal/model/post_model.dart';
import 'package:blog_minimal/modules/home/controller/home_controller.dart';
import 'package:blog_minimal/screens/category_page.dart';
import 'package:blog_minimal/screens/post_details_page.dart';
import 'package:blog_minimal/screens/post_editor.dart';
import 'package:blog_minimal/screens/user_profile.dart';
import 'package:blog_minimal/widgets/post_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
          'Snippet Buddy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8),
          //   child: InkWell(
          //     child: Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         CircleAvatar(
          //           backgroundColor: Colors.grey[200],
          //           child: Icon(
          //             Icons.notifications_outlined,
          //             color: Colors.grey,
          //           ),
          //         ),
          //         Positioned(
          //           top: 6,
          //           right: 0,
          //           child: CircleAvatar(
          //             radius: 5,
          //             backgroundColor: Colors.red,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
      // bottomNavigationBar: BottomBarWidget(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Add Post"),
        // backgroundColor: Color(0xFFFFD810),
        // elevation: 0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PostEditor()));
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for articles, author, and tags',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 130,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/writing_1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/writing_2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/writing_3.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your daily read',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
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
            ),
          ],
        ),
      ),
    );
  }
}
