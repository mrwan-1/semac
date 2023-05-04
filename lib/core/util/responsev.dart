// import 'package:flutter/material.dart';

// class ResponsiveArgs {
//   final MediaQueryData mediaQueryData;
//   final Size size;
//   final bool allowFontAccesibility;
//   final bool useSafeArea;

//   const ResponsiveArgs({
//     required this.mediaQueryData,
//     this.size = const Size(100, 100),
//     this.allowFontAccesibility = true,
//     this.useSafeArea = false,
//   });
// }

// class Responsive {
//   static Size? _device;
//   static Size? _innerSize;
//   static bool? _allowFontAccesibility, _useSafeArea;
//   static MediaQueryData? _mediaQueryData;

//   static set innerSize(Size innerSize) {
//     _innerSize = innerSize;
//   }

//   init(ResponsiveArgs args) {
//     _mediaQueryData = args.mediaQueryData;
//     _device = args.size;
//     innerSize = args.size;
//     _allowFontAccesibility = args.allowFontAccesibility;
//     _useSafeArea = args.useSafeArea;
//   }

//   double wdp(double pixels) {
//     final padding = _useSafeArea == true
//         ? _mediaQueryData!.padding.left + _mediaQueryData!.padding.right
//         : 0;
//     final deviceWidth = _mediaQueryData!.size.width;
//     final ratio = (deviceWidth - padding) / _device!.width;
//     return pixels * ratio;
//   }

//   double hdp(double pixels) {
//     final padding = _useSafeArea == true
//         ? _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom
//         : 0;
//     final deviceHeight = _mediaQueryData!.size.height;
//     final ratio = (deviceHeight - padding) / _device!.height;
//     return pixels * ratio;
//   }

//   double sp(double pixels) {
//     // debugPrint(_mediaQueryData.toString());
//     final value = hdp(pixels); //max(wdp(pixels), hdp(pixels));
//     return _allowFontAccesibility == true
//         ? value
//         : value / _mediaQueryData!.textScaleFactor;
//   }

//   // double minSp(double pixels) {
//   //   // debugPrint(_mediaQueryData.toString());
//   //   final value = min(wdp(pixels), hdp(pixels));
//   //   return _allowFontAccesibility
//   //       ? value
//   //       : value / _mediaQueryData.textScaleFactor;
//   // }

//   double vw(double percent) {
//     return (wdp(_device!.width) / 100) * percent;
//   }

//   double vh(double percent) {
//     return (hdp(_device!.height) / 100) * percent;
//   }

//   double wf(double percent) {
//     return (_innerSize!.width / 100) * percent;
//   }

//   double hf(double percent) {
//     return (_innerSize!.height / 100) * percent;
//   }
// }

// extension ResponsiveMeasurementsExtension on num {
//   double get wdp => Responsive().wdp(toDouble());

//   double get hdp => Responsive().hdp(toDouble());

//   double get sp => Responsive().sp(toDouble());

//   // double get minSp => Responsive.instance.minSp(this.toDouble());
//   double get vw => Responsive().vw(toDouble());

//   double get vh => Responsive().vh(toDouble());

//   double get wf => Responsive().wf(toDouble());

//   double get hf => Responsive().hf(toDouble());
// }

// extension ResponsiveInnerSizeExtension on BuildContext {
//   set innerSize(Size size) => Responsive.innerSize = size;
// }
