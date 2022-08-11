# Animated Dashed Circle

With this flutter package, you can add animated dashed circle to the picture you want. Story Widget :)

## Features

You can use it wherever you want to use Instagram story.

![Animated Dashed Circle Screenshot](https://avseng.net/animated_dashed/screenshot.png)

## Getting started

No permission is needed.

## Usage 

Please review the example folder

Define the widget,
```dart
    AnimatedDashedCircle().show(
        image: const AssetImage("assets/user.jpg"),
        autoPlay: true,
        duration: const Duration(seconds: 5),
        height: 250,
        borderWidth: 5,
    ),
```

To stop the animation,
```dart
    onPressed: () => AnimatedDashedCircle().stopCircle(),
```

To run the animation once,
![Animated Dashed Forward Gif](https://avseng.net/animated_dashed/forward.gif)
```dart
    onPressed: () => AnimatedDashedCircle().playCircle(),
```

To repeat the animation
![Animated Dashed Repeat Gif](https://avseng.net/animated_dashed/repeat.gif)
```dart
    onPressed: () => AnimatedDashedCircle().playCircle(type: AnimatedionDashedCircleType.repeat),
```


## Additional information

avseng.net
