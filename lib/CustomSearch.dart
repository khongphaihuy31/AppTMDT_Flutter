import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/widgets/ContentSearch.dart';
import 'package:thiketthuchocphan_mobile/widgets/ContentSearchEnter.dart';

class CustomSearch extends SearchDelegate{
  final User user;
  CustomSearch({required this.user});
  List<String> allData = [
    "Áo thun", "Quần jean", "Áo khoác", "Áo polo",
    "Áo sơ mi", "Quần shorts"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: (){
            query = '';
          },
          icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ContentSearchEnter(keyword: query, user: user);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in allData){
      if(item.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        // return ListTile(
        //   title:  Text(result),
        // );
        return InkWell(
          onTap: (){
            switch(matchQuery[index]){
              case 'Áo thun':
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentSearch(keyword: 'aothun', user: user, kw: 'Áo thun',)));
                break;
              case 'Áo sơ mi':
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentSearch(keyword: 'aosomi', user: user, kw: 'Áo sơ mi',)));
                break;
              case 'Áo khoác':
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentSearch(keyword: 'aokhoacao', user: user, kw: 'Áo khoác',)));
                break;
              case 'Áo polo':
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentSearch(keyword: 'aopolo', user: user, kw: 'Áo polo',)));
                break;
              case 'Quần jean':
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentSearch(keyword: 'quanjean', user: user, kw: 'Quần jean',)));
                break;
              case 'Quần shorts':
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentSearch(keyword: 'quanshorts', user: user, kw: 'Quần shorts',)));
                break;
            }
          },
          child: ListTile(
            title:  Text(result),
          )
        );
      }
    );
  }
  
}