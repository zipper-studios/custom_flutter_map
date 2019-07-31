# flutter_map: display a custom popup when the marker is tapped 



This project uses the [flutter_map](https://pub.dev/packages/flutter_map) package to integrate a map and attach a custom popup to a specific marker when it is tapped.
Adding a specific marker on a FlutterMap generated some issues for many developers. [Here](https://github.com/johnpryan/flutter_map/issues/354) you can find more details. 


Read the  [Flutter_map: custom popup above the marker](https://medium.com/p/732d26ef9bc7/edit) article on Medium for a detailed documentation. 

## Running

Before running the app, go to [Mapbox](https://www.mapbox.com/), create an account, sign in and stylize your map. After you create a beautiful map, copy its integration URL and paste it inside `home_screen.dart` file as a value for `urlTemplate` parameter of `TileLayerOptions` widget. Complete the `additionalsOptions` parameters with requierd values: `acceessToken` and `id`.

## Results

<p float="left">
  <img src="https://github.com/zipper-studios/custom_flutter_map/blob/master/assets/screenshoots/screenshoot2.png" width="400" />
  <img src="https://github.com/zipper-studios/custom_flutter_map/blob/master/assets/screenshoots/screenshoot1.png" width="400" /> 
</p>

