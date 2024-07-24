import 'package:anime/Block/anime_bloc.dart';
import 'package:anime/Repository/ModelClass/AnimeModel.dart';
import 'package:anime/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late AnimeModel data;

  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(FetchAnime());
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.format_align_left_sharp,
                      color: Color(0xFF110E47),
                      size: 40,
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'FilmKu',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.merriweather(
                        textStyle: TextStyle(
                          color: Color(0xFF110E47),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(width: 70.w),
                    Icon(
                      Icons.notification_add_outlined,
                      size: 40,
                      color: Color(0xFF110E47),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      'Now Showing',
                      style: GoogleFonts.merriweather(
                        textStyle: TextStyle(
                          color: Color(0xFF110E46),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                    ),
                    Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFE5E4EA)),
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 500.w,
                height: 305.h,
                child: BlocBuilder<AnimeBloc, AnimeState>(
                  builder: (context, state) {
                    if (state is AnimeBlocLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is AnimeBlocError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (state is AnimeBlocLoaded) {
                      data = BlocProvider.of<AnimeBloc>(context).animeModel;
                      return ListView.separated(
                        itemCount: data.data!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  width: 180.w,
                                  height: 288.h,
                                  color: Colors.white54,
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) => Screen2(img:data
                                                      .data![position].image
                                                      .toString(), title:data.data![position].title.toString(), synopsis:data.data![position].synopsis.toString() ,)));
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(data
                                                .data![position].image
                                                .toString())),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 60,
                                        child: Text(
                                          maxLines: 1,
                                          data.data![position].title.toString(),
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 30,
                                        ),
                                        child: Row(
                                          children: [
                                            RatingBar.builder(
                                              itemSize: 20,
                                              initialRating: 1,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 1,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, position) {
                          return SizedBox(
                            width: 10.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      'Popular',
                      style: GoogleFonts.merriweather(
                        textStyle: TextStyle(
                          color: Color(0xFF110E46),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180.w,
                    ),
                    Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFE5E4EA)),
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
              SizedBox(
                height: 20,
              ),
              BlocBuilder<AnimeBloc,AnimeState>(
                builder: (context, state) {
                  if (state is AnimeBlocLoading)
                  return Center(child: CircularProgressIndicator(),);
                  if (state is AnimeBlocError) {
                  return Center(child: Text("Error"),);
                  }
                  if (state is AnimeBlocLoaded) {
                  data = BlocProvider
                      .of<AnimeBloc>(context)
                      .animeModel;
                  return SizedBox( width: 500.w,
                    height: 300.h,
                    child: ListView.separated(
                    itemCount: data.data!.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, position) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 180.w,
                                height: 240.h,
                                color: Colors.white54,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) => Screen2(img:  data.data![position].image.toString(), title: data.data![position].title.toString(), synopsis:data.data![position].synopsis.toString())));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                    data.data![position].image.toString()
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 60,
                                    child: Text(
                                      maxLines: 1,
                    data.data![position].title.toString(),                                      style: GoogleFonts.mulish(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, top: 20),
                                    child: Row(
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 20,
                                          initialRating: 1,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 1,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60.w,
                                          height: 20.h,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFDBE3FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'HORROR',
                                              style: GoogleFonts.mulish(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF87A3E8),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 60.w,
                                          height: 20.h,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFDBE3FF),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'THRILLER',
                                              style: GoogleFonts.mulish(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF87A3E8),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        '1h 47m',
                                        style: GoogleFonts.mulish(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                                    },
                                  ),
                  );
                }
                  else{
                    return SizedBox();
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
