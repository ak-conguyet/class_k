
import 'package:class_k/Models/Class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Class_Event.dart';
import 'Class_State.dart';

class ClassBloc extends Bloc<ClassEvent,ClassState>{
  ClassBloc():super(Class_initical_state()){
    on<Class_request>((event, emit) => _onRequest());
  }

  void _onRequest() async{
    emit(Class_loading_state());
    List<Class> classRoom = [
      Class(
        name: 'Data Structure and Algorithms',
        term: '1A',
        lecturers: 'Jonh Heart'
      ),
      Class(
          name: 'Artificial Intelligence',
          term: '1B',
          lecturers: 'Jonh Heart'
      ),
      Class(
          name: 'Data Structure and Algorithms',
          term: '1A',
          lecturers: 'Jonh Heart'
      ),
      Class(
          name: 'Data Structure and Algorithms',
          term: '1A',
          lecturers: 'Jonh Heart'
      ),
    ];
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(Class_successful_state(classRoom));
    } catch (e, s) {
      emit(Class_failure_state());
      print(s);
    }
  }

}