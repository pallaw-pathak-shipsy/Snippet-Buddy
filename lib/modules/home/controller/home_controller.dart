import 'package:blog_minimal/core/service/data_service.dart';
import 'package:blog_minimal/model/post_model.dart';
import 'package:blog_minimal/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  final DataService _dataService = serviceLocator<DataService>();
  final _listOfPost = [
    Post(
      image: 'assets/images/ikigai.jpg',
      title: 'Finding your ikigai in your middle age',
      author: Author(id: "324", name: 'John Johny'),
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/leader.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: Author(id: "324", name: 'John Johny'),
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/minimal.jpg',
      title: 'How Minimalism Brought Me',
      author: Author(id: "324", name: 'John Johny'),
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/colors.jpg',
      title: 'The Most Important Color In UI Design',
      author: Author(id: "324", name: 'John Johny'),
      date: '11 Mar 2020',
    ),
    Post(
      image: 'assets/images/ikigai.jpg',
      title: 'Finding your ikigai in your middle age',
      author: Author(id: "324", name: 'John Johny'),
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/leader.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: Author(id: "324", name: 'John Johny'),
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/minimal.jpg',
      title: 'How Minimalism Brought Me',
      author: Author(id: "324", name: 'John Johny'),
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/colors.jpg',
      title: 'The Most Important Color In UI Design',
      author: Author(id: "324", name: 'John Johny'),
      date: '11 Mar 2020',
    ),
  ];

  List<Category> getAllCategory() {
    return [];
  }

  Future<List<Post>> getAllSnippet() async {
    final listDataFromApi = await _dataService.getAllSnippet();
    return [..._listOfPost, ...listDataFromApi];
  }
}
