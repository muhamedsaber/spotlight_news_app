import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight/core/extensions/media_query.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key,
   required this.message,
    required this.icon
  });
final String message;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: EdgeInsets.only(top: context.height * 0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     
                      children: [
                        Icon(icon,
                            size: 50.h, color: Colors.grey[400]
                        ),
                        SizedBox(height:10.h,),
                        Text( message,
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                    ),
                      ],
                    )
                  );
  }
}