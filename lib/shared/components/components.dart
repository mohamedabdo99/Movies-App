import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/details/details_screen.dart';
import 'package:movie_app/modules/search/search_screen.dart';


Widget defaultTextFiled({
  @required TextEditingController ?controller,
  @required TextInputType ? type ,
  bool  isPassword = false,
  Function? onTap,
  Function? onChange,
  @required String ? label ,
  @required IconData ? suffix,
  IconData? prefix,
  }) => TextFormField(
  controller: controller ,
  keyboardType: type,
  obscureText: isPassword,
  onTap: (){
    onTap!();
  },
      onChanged: (value) {
        onChange!(value);
      },
  decoration: InputDecoration(
  labelText: label,
  prefixIcon: suffix != null ? Icon(
        prefix,
    ) : null,
    suffixIcon: Icon(
        suffix,
    ),
    border: OutlineInputBorder(),
  ),
);

Widget defultTaskItem(Map model,context) =>  Dismissible(
  key: Key(model['id'].toString()),
  child:Padding(
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            CircleAvatar(
  
              radius: 40.0,
  
              child: Text(
  
                "${model['time']}"
  
              ),
  
            ),
  
            SizedBox(width: 10.0,),
  
            Expanded(
  
              child: Column(
  
                mainAxisSize: MainAxisSize.min,
  
                children: [
  
                  Text(
  
                    "${model['title']}",
  
                    style: TextStyle(
  
                      fontSize: 17.0,
  
                      fontWeight: FontWeight.bold,
  
                    ),
  
                  ),
  
                  Text(
  
                    "${model['date']}",
  
                    style: TextStyle(
  
                      color: Colors.grey,
  
                    ),
  
                  ),
  
                ],
  
              ),
  
            ),
  
            SizedBox(width: 10.0,),
  
            IconButton(
  
              onPressed: ()
  
              {
  
              }, 
  
              icon: Icon(
  
                Icons.check_box,
  
              )),
  
            IconButton(
  
              onPressed: ()
  
              {
              }, 
  
              icon: Icon(
  
                Icons.archive,
  
              )),
  
          ],
  
          ),
  
      ),
  onDismissed:(direction){
  },
);

Widget buildArticleItem(article , context )=> InkWell(
  onTap: ()
  {
    navigateTo(context, DetailsScreen(article));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          padding: EdgeInsets.only(left: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/original${article['poster_path']}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${article['title']}",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${article['original_title']}",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget myDivider() => Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Divider(
    height: 10,
    thickness: 2,
    indent: 20,
    endIndent: 20,
  ),
);

Widget articleBuilder(list , context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget
    ),
);