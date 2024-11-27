import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'service/location_service.dart';
import 'ui/main_page.dart';


// for maps
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const GNSSDemoApp());

class GNSSDemoApp extends StatelessWidget {
	const GNSSDemoApp({super.key});

	static const appTitle = 'Flutter GNSS Demo';

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: appTitle,
			//home: MyHomePage(title: appTitle),
			home: buildAppWidget(context)
		);
	}
  
  
  

	@override
	Widget buildAppWidget(BuildContext context) {

		Widget sw = Scaffold (
			appBar: AppBar(title: const Text ('Flutter GNSS Demo')),
			drawer: Drawer (
				  child: ListView(
					// Important: Remove any padding from the ListView.
					padding: EdgeInsets.zero,
					children: [
						const DrawerHeader(decoration: BoxDecoration(color: Colors.blue,),child:Text('Drawer Header'),),
						ListTile(title: const Text('Item 1'), onTap: () {},),
						ListTile(title: const Text('Item 2'), onTap: () {},),
						ListTile(title: const Text('Item 3'), onTap: () {},),
					],
				),
			),
			body: buildMapWidget(context)
		);

		return sw;

	}
	
	// from https://docs.fleaflet.dev/
	Widget buildMapWidget(BuildContext context) {
			return FlutterMap(
				options: MapOptions(
				initialCenter: LatLng(53.28, -8.98),
				initialZoom: 14,
			),
			children: [
				TileLayer( 
					urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
					userAgentPackageName: 'com.test.exampleapp',
				),
          
				MarkerLayer( markers: [
					Marker(point: LatLng(53.2856, -8.9827),width: 32, height: 32, child: FlutterLogo(),),
				]),


				RichAttributionWidget( 
					attributions: [
						TextSourceAttribution('OpenStreetMap contributors'),
					],
				),      
			],
		); // end FlutterMap constructor
	}
	
	
	
}

