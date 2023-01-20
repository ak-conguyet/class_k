import 'package:class_k/Component/FailureWG.dart';
import 'package:class_k/Component/LodingWG.dart';
import 'package:class_k/Constans/KColors.dart';
import 'package:class_k/ui/class/bloc/Class_Bloc.dart';
import 'package:class_k/ui/class/bloc/Class_Event.dart';
import 'package:class_k/ui/class/bloc/Class_State.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Component/CustomBloc.dart';

class ClassPage extends CustomBloc<ClassBloc,ClassState>{

  final List<String> _lotties = ['98849-book-lover.json','101088-kids-studying-from-home.json','101546-study-abroad.json','101674-science-lover.json'];

  ClassPage({super.key, required super.bloc});

  @override
  Widget stateBuilder(ClassState state) {
    if(state is Class_initical_state){
      bloc.add(Class_request());
      return LoadingWG();
    }
    if(state is Class_loading_state){
      return LoadingWG();
    }
    if(state is Class_successful_state){
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: state.classRoom.length,
        itemBuilder: (context,index) => Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: KColors.primary,
                    width: 0.5
                )
            ),
          ),
          child: InkWell(
            onTap: (){},
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            state.classRoom[index].name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Tern: ${state.classRoom[index].term}\bLecturers: ${state.classRoom[index].lecturers}'
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:
                  Lottie.asset('lotties/${_lotties[index]}'),
                )
              ],
            ),
          ),
        ),
      );
    }
    return FailureWG();
  }

  @override
  void listener(BuildContext context, ClassState state) {
    // TODO: implement listener
  }






}
