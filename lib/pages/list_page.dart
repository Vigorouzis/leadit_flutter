import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadit_flutter/bloc/list_bloc.dart';
import 'package:leadit_flutter/bloc/list_event.dart';
import 'package:leadit_flutter/bloc/list_state.dart';
import 'package:leadit_flutter/pages/details_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListBloc _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = BlocProvider.of(context);
    _listBloc.add(GetDataFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ListLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(state.posts[index]))),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                width: 150.0,
                                child: Image.network(
                                    state.posts[index].smallPhotoUrl),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                child: Text(
                                  state.posts[index].title,
                                  style: new TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is ListFailed) {
              return Center(
                child: Text(state.errorMessage),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
