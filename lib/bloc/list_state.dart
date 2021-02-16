import 'package:equatable/equatable.dart';

import 'package:leadit_flutter/models/post.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  final List<Post> posts;

  const ListLoaded({this.posts});

  @override
  List<Object> get props => [posts];
}

class ListFailed extends ListState {
  final String errorMessage;
  const ListFailed({
    this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
