import 'package:class_k/Models/Class.dart';
import 'package:class_k/Models/Post.dart';
import 'package:equatable/equatable.dart';
abstract class ClassState extends Equatable{}

class Class_initical_state extends ClassState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class Class_loading_state extends ClassState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Class_successful_state extends ClassState{
  Class_successful_state(this.classRoom);
  final List<Class> classRoom;
  @override
  // TODO: implement props
  List<Object?> get props => [classRoom];

}

class Class_failure_state extends ClassState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}