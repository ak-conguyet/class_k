import 'package:class_k/Component/LoadingAnimation.dart';
import 'package:class_k/Constans/KColors.dart';
import 'package:class_k/Utils/Utils.dart';
import 'package:class_k/ui/account/Account_Page.dart';
import 'package:class_k/ui/class/Class_Page.dart';
import 'package:class_k/ui/class/bloc/Class_Bloc.dart';
import 'package:class_k/ui/home/Home_Page.dart';
import 'package:class_k/ui/home/bloc/Home_bloc.dart';
import 'package:class_k/ui/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Class K',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
            colorScheme: ColorScheme.light(
              primary: KColors.primary,
              secondary: KColors.secondary,
            ),
            textTheme: ThemeData.light().textTheme.apply(
                fontFamily: 'OpenSans'
            ),
          useMaterial3: true
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> HomeBloc()),
            BlocProvider(create: (context)=> ClassBloc())
          ],
          child:  LoginPage()
        )
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _pages =  [HomePage(), ClassPage(), AccountPage()];
  int _currentIndex = 0;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0,keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context,isInner){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.white,
              collapsedHeight: 75,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top, left: 20, right: 20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        child: Image.network(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                          isInner ? 'Rohan' : '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Badge(
                        child: GestureDetector(
                          child: Icon(
                            Iconsax.notification,
                            size: 30,
                          ),
                        ),
                        badgeContent: const Text(
                          '3',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              elevation: 0,
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 150,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Hey Rohan,',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Which skill are you looking to \nacquire today?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                collapseMode: CollapseMode.pin,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius:const BorderRadius.all(Radius.circular(15))
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something',
                        prefixIcon: Icon(Iconsax.search_normal)
                    ),
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ),
            ),
          ];
        },
        body: PageView(
          controller: _pageController,
          physics:const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
          strokeColor: KColors.secondaryS,
          selectedColor: KColors.primary,
          unSelectedColor: KColors.secondary,
          items: [
            CustomNavigationBarItem(icon: const Icon(Iconsax.home)),
            CustomNavigationBarItem(icon: const Icon(Iconsax.book)),
            CustomNavigationBarItem(icon: const Icon(Iconsax.personalcard)),
          ],
          currentIndex: _currentIndex,
          onTap: (index) => navTap(index),
      )
    );
  }
  
  void navTap(int index){
    if(index == 2){
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>AccountPage()));
      startActivity(context, AccountPage());
      return;
    }
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    setState(() {
      _currentIndex = index;
    });
  }
}
