// import 'package:flutter/material.dart';
// import 'dart:convert';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Map data = {};

//   @override
//   Widget build(BuildContext context) {
//     // Retrieve the arguments from ModalRoute
// dynamic arguments = ModalRoute.of(context)?.settings.arguments;

//     if (arguments != null && arguments is Map) {
//       data = arguments;
//     } else {
//       // Handle the case when arguments are null or not of the expected type
//       data = {
//         'location': 'Unknown Location',
//         'time': 'Unknown Time',
//         'isDaytime': true,
//       };

//     }
//     return Scaffold(
//         backgroundColor: bgColor,
//         body: SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/$bgImage'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
//           child: Column(
//             children: <Widget>[
//               TextButton.icon(
//                     onPressed: () async {
//                       dynamic result =
//                           await Navigator.pushNamed(context, '/location');
//                       setState(() {
//                         data = {
//                           'time': result['time'],
//                           'location': result['location'],
//                           'isDaytime': result['isDaytime'],
//                           'flag': result['flag']
//                         };
//                       });
//                 },
//                     icon: Icon(Icons.edit_location, color: Colors.grey[300]),

//                 label: Text('Edit Location'),
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     data['location'],
//                     style: TextStyle(
//                       fontSize: 28.0,
//                       letterSpacing: 2.0,
//                           color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 data['time'],
//                 style: TextStyle(
//                   fontSize: 66.0,
//                       color: Colors.white
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
// )
//     );
//   }
// }

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;


    // set background image
String bgImage = (data['isDaytime'] ?? false) ? 'day.png' : 'night.png';
    Color bgColor =
        (data['isDaytime'] ?? false) ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    if (result != null) {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(data['time'],
                    style: TextStyle(fontSize: 66.0, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
