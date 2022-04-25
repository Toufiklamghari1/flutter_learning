import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitReposPage extends StatefulWidget {
 String? login;
 String? avatarUrl;
  getLogin() => login;
  getAvatartUrl() => avatarUrl;
  GitReposPage({this.login,this.avatarUrl});

  @override
  State<GitReposPage> createState() => _GitReposPageState();
}

class _GitReposPageState extends State<GitReposPage> {
  List<dynamic> repos=[];
  dynamic data;
  _searchRepos() async {
    var url = Uri.parse("https://api.github.com/users/${widget.getLogin()}/repos");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){

      setState(() {
        this.data = json.decode(response.body);
        this.repos.addAll(data);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchRepos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repositories ${widget.getLogin()}'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.getAvatartUrl()),
            radius: 25,
          )
        ],
      ),
      body: Center(
            child: ListView.separated(
                itemCount:(repos == null) ? 0 : repos.length,
                itemBuilder: (context,index){
                  return ListTile(

                    title: Text('${data[index]['name']}'),
                  );
                },
                separatorBuilder: (context,index) => Divider(height: 3, color: Colors.deepOrange,),

            ),
      ),
    );
  }
}
