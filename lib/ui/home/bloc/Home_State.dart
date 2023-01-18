import 'package:class_k/Models/Post.dart';
import 'package:equatable/equatable.dart';
abstract class HomeState extends Equatable{}

class Home_initical_state extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class Home_loading_state extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Home_successful_state extends HomeState{
  Home_successful_state(this.post);
  final List<Post> post;
  @override
  // TODO: implement props
  List<Object?> get props => [post];

}

class Home_failure_state extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}