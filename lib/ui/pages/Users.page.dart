
import 'dart:convert';

import 'package:app_flutter/ui/pages/Repos.page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query="";
  bool notVisible=false;
  dynamic data;
  int currentPage=0;
  int totalPages=0;
  int pageSize=20;
  List<dynamic> items=[];
  ScrollController scrollController = new ScrollController();
  TextEditingController queryTextEditingController = new TextEditingController();
  void _search(String query) {
    var url;

     url = Uri.parse("https://api.github.com/search/users?q=${query}&per_page=$pageSize&page=$currentPage");
    http.get(url)
        .then((response){
      setState(() {
        this.data = json.decode(response.body);
        this.items.addAll(data['items']);
        if(data['total_count'] % this.pageSize == 0 ){
          this.totalPages = data['total_count']~/this.pageSize;
        }else{
          this.totalPages = (data['total_count']/this.pageSize).floor() + 1;
        }


      });
    })
        .catchError((error){
      print(error);
    });
  }
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels== scrollController.position.maxScrollExtent){
        setState(() {

          if(currentPage<totalPages){
            currentPage++;
            _search(query);
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users => ${query} => $currentPage/$totalPages"),),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: notVisible,
                      onChanged: (value) {
                        setState(() {
                          this.query=value;
                        });
                      },
                      controller: queryTextEditingController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                                notVisible==true ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                             setState(() {
                               notVisible= !notVisible;
                             });

                            },
                          ),
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide(
                                width: 10, color: Colors.white24,
                              )
                          )
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                      items=[];
                      currentPage=0;
                      totalPages=0;
                      this.query = queryTextEditingController.text;
                      _search(query);

                }, icon: Icon(Icons.search,color: Colors.deepOrange,))
              ],
            ),
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                itemCount:items.length,
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => GitReposPage(login: items[index]['login'], avatarUrl: items[index]['avatar_url'])));},
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundImage: NetworkImage(items[index]['avatar_url']),
                            radius: 40,
                            ),
                            SizedBox(width: 30,),
                            Text('${items[index]['login']}'),
                          ],
                        ),
                        CircleAvatar(
                          child: Text('${items[index]['score']}'),
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (context,index) => Divider(height: 2, color: Colors.deepOrange,),
              ),
            )
          ],
        ),
      ),

    );
  }


}
