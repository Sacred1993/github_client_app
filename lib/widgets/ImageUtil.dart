import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  /**
   * 专门用于获取头像图片
   */
  static Widget gmAvatar(
    String url, {
    double width = 30,
    double height,
    BoxFit fit,
    BorderRadius borderRadius,
  }) {
    var placeholder = Image.asset(
      "imgs/avatar-default.png", //头像占位图，加载过程中显示
      width: width,
      height: height,
    );
    return ClipRRect(
      //剪裁为圆角矩形
      borderRadius: borderRadius ?? BorderRadius.circular(2),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) => placeholder,
      ),
    );
  }
}
