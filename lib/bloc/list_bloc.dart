import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:leadit_flutter/bloc/list_event.dart';
import 'package:leadit_flutter/bloc/list_state.dart';
import 'package:leadit_flutter/models/post.dart';
import 'package:leadit_flutter/services/api_provider.dart';
import 'package:leadit_flutter/services/hive_names.dart';
import 'package:url_launcher/url_launcher.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial());

  ApiProvider _provider = ApiProvider();

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is GetDataFromApi) {
      yield ListLoading();

      List<Post> _posts = await _provider.getPosts();

    //additional task saving posts to the local database
      var box = await Hive.openBox(HiveBoxes.posts);
      box.put(HiveBoxes.posts, _posts);
      box.close();

      yield ListLoaded(posts: _posts);
    }
  }
}
