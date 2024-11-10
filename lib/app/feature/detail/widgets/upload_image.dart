// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:inthon_front/app/data/extension/build_context_x.dart';
// import 'package:inthon_front/app/feature/detail/logic/detail_controller.dart';
// import 'package:inthon_front/app/widget/e_cached_image.dart';

// class UploadImage extends StatefulWidget {
//   const UploadImage({super.key, this.image});

//   final XFile? image;

//   @override
//   State<UploadImage> createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   bool isPressed = false;
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 100,
//       height: 100,
//       child: GestureDetector(
//         onTap: () => DetailController.to.uploadMyImage(1),
//         child: DottedBorder(
//           color: context.getColorScheme.primary,
//           strokeWidth: 1.5,
//           dashPattern: [6, 3],
//           child: widget.image == null
//               ? Center(
//                   child: Icon(
//                     Icons.add,
//                     color: context.getColorScheme.primary.withOpacity(0.8),
//                     size: 26,
//                   ),
//                 )
//               : Image.file(
//                   File(widget.image!.path),
//                   fit: BoxFit.cover,
//                 ),
//         ),
//       ),
//     );
//   }
// }
