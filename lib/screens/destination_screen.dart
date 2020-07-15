import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sampleproject/models/activity_model.dart';
import 'package:sampleproject/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating){
    String stars = '';
    for(int i = 0;i<rating;i++){
    stars+='⭐';
    }
    stars.trim();
    return Text(stars);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Stack(children: <Widget>[
          Container(height:MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
          boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(0.0,2.0),blurRadius: 6.0)]
          ),
          child: Hero(
            tag: widget.destination.imageUrl,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(widget.destination.imageUrl,
              fit: BoxFit.cover,
              ),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                  IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: ()=>Navigator.pop(context),
                ),
              Row(children: <Widget>[
                   Padding(
                padding: EdgeInsets.symmetric(horizontal:10.0,vertical:40.0),
                  child: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: ()=>Navigator.pop(context),
                ),
              ),
                 Padding(
                padding: EdgeInsets.symmetric(horizontal:10.0,vertical:40.0),
                  child: IconButton(
                  icon: Icon(Icons.sort),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: ()=>Navigator.pop(context),
                ),
              ),
              ],)
            ],
            ),
          ),
          Positioned(
                  left: 20.0,
                  bottom: 20.0,
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                    Text(widget.destination.city,
                     style: TextStyle(fontSize: 30.0,
                       color:Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2
                         ),
                         ),
                         Row(
                           children: <Widget>[
                             Icon(
                              FontAwesomeIcons.locationArrow,
                               size: 10.0,
                               color: Colors.white70,
                               ),
                               Text(
                               widget.destination.country,
                                style: TextStyle(
                                   color: Colors.white70
                                   ),
                                   ),
                                   ]
                                   )
                                   ],
                                   ),
                                   ),
                                Positioned(right: 20.0,bottom: 20.0,
                                child: Icon(Icons.add_location,size: 20.0,color: Colors.white70,),
                                )
          ],
          ),
          Expanded(
               child: ListView.builder(
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context,int index){
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100.0,20.0,20.0,20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Container(
                              width: 120.0,
                              child: Text(
                              activity.name,
                              style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                              maxLines:2,
                              overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text('\$${activity.price}',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600
                                ),),
                                Text('per pax',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey
                                ),
                                ),
                              ],
                            )
                          ],
                          ),
                          _buildRatingStars(activity.rating),
                          Text(activity.type),
                           SizedBox(height: 10.0),
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                alignment: Alignment.center,
                                child: Text(activity.startTimes[0])
                                ),
                            ),
                              SizedBox(width: 10.0,),
                              Container(
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              alignment: Alignment.center,
                              child: Text(activity.startTimes[1])
                              )
                          ])
                        ],),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                          )
                          ),
                    )
                  ],
                );
              },),
          )
      ],),
    );
  }
}