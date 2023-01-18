
import 'package:class_k/Models/Post.dart';
import 'package:class_k/ui/home/bloc/Home_Event.dart';
import 'package:class_k/ui/home/bloc/Home_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(Home_initical_state()){
    on<Home_request>((event, emit) => _onRequest());
  }

  void _onRequest() async{
    emit(Home_loading_state());
    List<Post> posts = [
      Post(
          uid: '212414',
          title: 'Homework in seconds',
          content: 'Quickly and easily set homework from in the class or at home within Class Charts.To ensure your pupils are keeping on top of homework you can use the Class Charts Homework module to manage the homework process remotely. Our Homework Module will make it easy for schools to effectively track and set homework and send out any other necessary information. Click here for information on our announcements module.',
          time: '10:04 AM'
      ),
      Post(
          uid: '212414',
          title: 'Homework in seconds',
          content: 'Quickly and easily set homework from in the class or at home within Class Charts.To ensure your pupils are keeping on top of homework you can use the Class Charts Homework module to manage the homework process remotely. Our Homework Module will make it easy for schools to effectively track and set homework and send out any other necessary information. Click here for information on our announcements module.',
          time: '10:04 AM'
      ),
      Post(
          uid: '212414',
          title: 'Homework in seconds',
          content: 'Quickly and easily set homework from in the class or at home within Class Charts.To ensure your pupils are keeping on top of homework you can use the Class Charts Homework module to manage the homework process remotely. Our Homework Module will make it easy for schools to effectively track and set homework and send out any other necessary information. Click here for information on our announcements module.',
          time: '10:04 AM'
      ),
      Post(
          uid: '212414',
          title: 'Homework in seconds',
          content: 'Quickly and easily set homework from in the class or at home within Class Charts.To ensure your pupils are keeping on top of homework you can use the Class Charts Homework module to manage the homework process remotely. Our Homework Module will make it easy for schools to effectively track and set homework and send out any other necessary information. Click here for information on our announcements module.',
          time: '10:04 AM'
      ),
      Post(
          uid: '212414',
          title: 'Homework in seconds',
          content: 'Quickly and easily set homework from in the class or at home within Class Charts.To ensure your pupils are keeping on top of homework you can use the Class Charts Homework module to manage the homework process remotely. Our Homework Module will make it easy for schools to effectively track and set homework and send out any other necessary information. Click here for information on our announcements module.',
          time: '10:04 AM'
      )
    ];
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(Home_successful_state(posts));
    } catch (e, s) {
      emit(Home_failure_state());
      print(s);
    }
  }

}