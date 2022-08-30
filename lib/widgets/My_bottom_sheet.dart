import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';
import 'package:todoapp/Providers/Database.dart';

import '../Models/task_model.dart';
import '../local_style/Local_styles.dart';
import '../local_style/icons.dart';
import 'My_button.dart';

TextEditingController currentPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();


var formState = GlobalKey<FormState>();

void My_bottom_sheet(@required BuildContext context,@required double height,@required double width,@required TaskModel taskdata)
{
  showBarModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) =>
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 25,
                    ),
                    child: Column(
                      children: [

                        Mbutton(width: width, height: height, colors: [Colors.red,
                         Colors.red.withOpacity(.8),], txt:taskdata.isFavorites==1?'Delete From Favourites':"Add To Favourites", wid: Icon(IconBroken.Heart,color: Colors.white,), func: () async {
                          TaskModel task = TaskModel(
                            title:taskdata.title ,
                            isCompleted: taskdata.isCompleted,
                            isFavorites:taskdata.isFavorites==0?1:0,
                            date: taskdata.date,
                            startTime: taskdata.startTime,
                            endTime: taskdata.endTime,
                            color: taskdata.color,
                            remind: taskdata.remind,
                            repeat: taskdata.repeat, id: taskdata.id,
                          );
                          Provider.of<Database_prov>(context,listen: false).updateTask(task);
                          Navigator.of(context).pop();

                        }),
                        SizedBox(
                          height: height/30,
                        ),
                        Mbutton(width: width, height: height, colors: [Colors.green,
                          Colors.green.withOpacity(.8),], txt: "Delte Task", wid: Icon(IconBroken.Close_Square,color: Colors.white,), func: () async {
                          Provider.of<Database_prov>(context,listen: false).deleteTask(taskdata.id!);
                          Navigator.of(context).pop();

                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );

}



