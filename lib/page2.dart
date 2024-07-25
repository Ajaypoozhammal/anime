import 'package:anime/page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatefulWidget {
  final String img;
  final String title;
  final String synopsis;

  const Screen2(
      {super.key,
      required this.img,
      required this.title,
      required this.synopsis});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    color: Colors.yellow,
                    child: Image.network(
                      widget.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  TextButton(onPressed: () { Navigator.of(context).pop(); },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,size: 30,color: Colors.white,),SizedBox(width: 250.w,),
                      Icon(Icons.more_horiz,size: 30,color: Colors.white,)
                    ],
                  ),)
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 260.w,
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
                        Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          widget.title,
                                          style: GoogleFonts.mulish(
                                              textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.40,
                                          ),),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Icon(
                                          Icons.bookmark_border_sharp,
                                          size: 20,
                                        )
                                      ],
                                    ),
                        ),
                                              Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: Row(
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: 1,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 1,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Text(
                                      '9.1/10 IMDb',
                                      style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                          color: Color(0xFF9B9B9B),
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                        ),
                                                ),
                                              SizedBox(height: 10.h,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Row(
                        children: [
                                  Container(
                                    width: 100.w,
                                    height: 40.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFDBE3FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'HORROR',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            color: Color(0xFF87A3E8),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    width: 100.w,
                                    height: 40.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFDBE3FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'THRILLER',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            color: Color(0xFF87A3E8),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Container(
                                    width: 100.w,
                                    height: 40.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFDBE3FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100.r)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'ACTION',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            color: Color(0xFF87A3E8),
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20,top: 5),
                                                child: Row(
                                                  children: [
                                                                        Column(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Length',
                                                                                      style: GoogleFonts.mulish(
                                                                                        textStyle: TextStyle(
                                                                                          color: Color(0xFF9B9B9B),
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.w400,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '2h 28min',
                                                                                      style: GoogleFonts.mulish(
                                                                                        textStyle: TextStyle(
                                                                                          color: Colors.black,
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                        ),
                                                                        SizedBox(
                                                                                  width: 60.w,
                                                                        ),
                                                                        Column(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Language',
                                                                                      style: GoogleFonts.mulish(
                                                                                        textStyle: TextStyle(
                                                                                          color: Color(0xFF9B9B9B),
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.w400,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'English',
                                                                                      style: GoogleFonts.mulish(
                                                                                        textStyle: TextStyle(
                                                                                          color: Colors.black,
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                        ),
                                                                        SizedBox(
                                                                                  width: 60.w,
                                                                        ),
                                                                        Column(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Rating',
                                                                                      style: GoogleFonts.mulish(
                                                                                        textStyle: TextStyle(
                                                                                          color: Color(0xFF9B9B9B),
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.w400,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'PG-13',
                                                                                      style: GoogleFonts.mulish(
                                                                                        textStyle: TextStyle(
                                                                                          color: Colors.black,
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                        ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10,right: 230),
                                                child: Text(
                        'Decsription',
                        style: GoogleFonts.merriweather(
                                  textStyle: TextStyle(
                                    color: Color(0xFF110E46),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                                                ),
                                              ),
                                                Text(widget.synopsis,
                        style: GoogleFonts.mulish(
                                  textStyle: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                                                ),
                                                Padding(
                        padding: const EdgeInsets.only(left: 20,top: 5),
                        child: Row(
                                  children: [
                                    Text(
                                      'Cast',
                                      style: GoogleFonts.merriweather(
                                        textStyle: TextStyle(
                                          color: Color(0xFF110E46),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200.w,
                                    ),
                                    Container(
                                      width: 80.w,
                                      height: 30.h,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side:
                                              BorderSide(width: 1, color: Color(0xFFE5E4EA)),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "See more",
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                              color: Color(0xFFAAA8B0),
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                        ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Row(
                                                          children: [
                                                            Container(
                                                              height: 100.h,
                                                              width: 80.w,
                                                              decoration: ShapeDecoration(
                                                                color: Colors.white,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.r)),
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  child: Image.asset("assets/b.png")),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 100.h,
                                                              width: 80.w,
                                                              decoration: ShapeDecoration(
                                                                color: Colors.white,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.r)),
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  child: Image.asset("assets/c.png")),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 100.h,
                                                              width: 80.w,
                                                              decoration: ShapeDecoration(
                                                                color: Colors.white,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.r)),
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  child: Image.asset("assets/d.png")),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 100.h,
                                                              width: 80.w,
                                                              decoration: ShapeDecoration(
                                                                color: Colors.white,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.r)),
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  child: Image.asset("assets/e.png")),
                                                            ),
                                                          ],
                                                ),
                                              ),
                                                Row(
                                                          children: [
                                                            Text(
                                                              'Tom Holland',
                                                              style: GoogleFonts.mulish(
                                                                textStyle: TextStyle(
                                                                color: Color(0xFF110E47),
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w400,
                                                                )
                                                              ),
                                                            ),
                                                            SizedBox(width: 25.w,)
                                                                        ,                      Text(
                                                              'Zenadaya',
                                                              style: GoogleFonts.mulish(
                                                                  textStyle: TextStyle(
                                                                    color: Color(0xFF110E47),
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                  )
                                                              ),
                                                            ),
                                                                        SizedBox(width: 20.w,),
                                                            Text(
                                                              ' Benedict\nCumberbatch',
                                                              style: GoogleFonts.mulish(
                                                                  textStyle: TextStyle(
                                                                    color: Color(0xFF110E47),
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                  )
                                                              ),
                                                            ),
                                                            SizedBox(width: 25.w,),

                                                            Text(
                                                              ' Jacon\nBatalon',
                                                              style: GoogleFonts.mulish(
                                                                  textStyle: TextStyle(
                                                                    color: Color(0xFF110E47),
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                  )
                                                              ),
                                                            ),
                                                          ],
                                                ),

            ],
          ),
        ),
      ),
    );
  }
}
