import 'package:flutter/material.dart';
class HomeScreeen extends StatefulWidget {
  static const String id = 'HomeScreeen';
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WhatsApp'),
            bottom:  const TabBar(
              tabs: [
                Tab(
                  child:Icon(Icons.camera_alt),
                ),
                Text('Chat'),
                Text('Status'),
                Text('Call'),
              ],
            ),
            actions: [
              const Icon(Icons.search),
              const SizedBox(width: 10,),
              PopupMenuButton(
                  itemBuilder: (context) =>[
                    const PopupMenuItem(
                      value: 1,
                        child: Text("New Groups")),
                    const PopupMenuItem(
                        value: 2,
                        child: Text("Settings")),
                    const PopupMenuItem(
                        value: 3,
                        child: Text("Logout")),
                  ]),
              const SizedBox(width: 10,),
            ],
          ),
          body:  TabBarView(
            children: [
              const Text('Camera'),
              ListView.builder(
                itemCount: 100,
                  itemBuilder: (context, index){
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/17049455/pexels-photo-17049455/free-photo-of-mother-and-a-daughter-touching-each-others-noses.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      ),
                      title: Text("Mian Mohsin"),
                      subtitle: Text("where is Husnain"),
                      trailing: Text("3:38 pm"),
                    );
                  }),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // const Text('New Updates'),
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.green,
                                    width:3
                              )
                            ),
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage('https://images.pexels.com/photos/17049455/pexels-photo-17049455/free-photo-of-mother-and-a-daughter-touching-each-others-noses.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                            ),
                          ),
                          title: const Text("Mian Mohsin"),
                          subtitle: const Text("35 min ago"),
                        ),
                      ],
                    );
                  }),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/17049455/pexels-photo-17049455/free-photo-of-mother-and-a-daughter-touching-each-others-noses.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      ),
                      title: const Text("Mian Mohsin"),
                      subtitle: Text(index /2==0 ? "You Missed audio Call" : 'You Missed video Call'),
                      trailing: Icon(index /2==0 ? Icons.phone:Icons.video_call),
                    );
                  }),
            ],
          ),

        ));
    
  }
}
