import 'package:class_k/Models/Post.dart';
import 'package:class_k/ui/home/bloc/Home_Event.dart';
import 'package:class_k/ui/home/bloc/Home_State.dart';
import 'package:class_k/ui/home/bloc/Home_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeBloc _bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      bloc: _bloc,
      builder: (context,state){
        if(state is Home_initical_state){
          _bloc.add(Home_request());
          return JumpingDotsProgressIndicator(fontSize: 20,);
        }
        if(state is Home_loading_state){
          return JumpingDotsProgressIndicator(fontSize: 20,);
        }

        if(state is Home_failure_state){
          return const Center(
            child: Text(
              'failure'
            ),
          );
        }
        List<Post> posts = (state as Home_successful_state).post;
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: posts.length,
            itemBuilder: (context, index) => _itemBuider(posts[index])
        );
      },
    );
  }

  Widget _itemBuider(Post posts) => Container(
    padding:const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerBuider(posts),
        const SizedBox(height: 20,),
        Text(
          '${posts.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          posts.content
        )
      ],
    ),
  );

  Container _headerBuider(Post posts) {
    return Container(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',width: 50,height: 50,fit: BoxFit.cover,),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Rohan ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            const TextSpan(
                                text: 'posted a post to '
                            ),
                            TextSpan(
                                text: 'CMP - 355',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ],
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7)
                          )
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        posts.time,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      );
  }
}
