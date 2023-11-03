import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat/image_util.dart';
import 'common_fresh.dart';
import 'dy_behavior_null.dart';

class PicInfo {
  final String? url;
  final File? file;
  final String? id;

  PicInfo({this.url, this.file, this.id});
}
class ChatPicturePreview extends StatefulWidget {
  ChatPicturePreview({
    Key? key,
    required this.picList,
    this.index = 0,
    this.tag,
    this.onDownload,
  })  : controller = ExtendedPageController(
    initialPage: index,
    pageSpacing: 10,
  ),
        super(key: key);
  final List<PicInfo> picList;
  final int index;
  final String? tag;
  final ExtendedPageController controller;
  final Future<bool> Function(String)? onDownload;
  @override
  State<ChatPicturePreview> createState() => _ChatPicturePreviewState();
}


class _ChatPicturePreviewState extends State<ChatPicturePreview> {
  int _currentIndex = 0;
  //使用1 创建GlobalKey
  GlobalKey<PartRefreshWidgetState> globalKey = GlobalKey();
  @override
  void initState() {
    _currentIndex=widget.index;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var child = ScrollConfiguration(
        behavior: DyBehaviorNull(),
        child: Stack(
      children: [
        _buildPageView(),
        _buildBackBtn(onTap: () => Navigator.pop(context)),
        PartRefreshWidget(globalKey, (){
          return _buildNum();
        }),
        _buildToolsBtn(onDownload: () {
          int index = widget.controller.page?.toInt() ?? 0;
          if (index < widget.picList.length) {
            widget.onDownload?.call(widget.picList.elementAt(index).url!);
          }
        }),
      ],
    ));
    return Material(
      //color: Color(0xFF000000),
      child: widget.tag == null ? child : Hero(tag: widget.tag!, child: child),
    );
  }
  fresh(){
    setState(() {
    });
  }
  Widget _buildChildView(int index) {
    var info = widget.picList.elementAt(index);
    if (info.file != null) {
      return ExtendedImage.file(
        info.file!,
        fit: BoxFit.fitWidth,
        mode: ExtendedImageMode.gesture,
        clearMemoryCacheWhenDispose: true,
        loadStateChanged: _buildLoadStateChangedView,
        initGestureConfigHandler: _buildGestureConfig,
      );
    } else if (info.url != null) {
      return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: ExtendedImage.network(
          info.url!,
          fit: BoxFit.fitWidth,
          mode: ExtendedImageMode.gesture,
          clearMemoryCacheWhenDispose: true,
          handleLoadingProgress: true,
          loadStateChanged: _buildLoadStateChangedView,
          initGestureConfigHandler: _buildGestureConfig,

        ),
      );
    } else {
      return _buildErrorView();
    }
  }

  GestureConfig _buildGestureConfig(ExtendedImageState state) => GestureConfig(
        //you must set inPageView true if you want to use ExtendedImageGesturePageView
        inPageView: true,
        initialScale: 1.0,
        maxScale: 5.0,
        animationMaxScale: 6.0,
        initialAlignment: InitialAlignment.center,
      );

  Widget? _buildLoadStateChangedView(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        {
          final ImageChunkEvent? loadingProgress = state.loadingProgress;
          final double? progress = loadingProgress?.expectedTotalBytes != null
              ? loadingProgress!.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null;
          return Center(
            child: Container(
              width: 40.w,
              height: 40.h,
              child: CircularProgressIndicator(
                value: progress,
              ),
            ),
          );
        }
      case LoadState.completed:
        {
          ///if you don't want override completed widget
          ///please return null or state.completedWidget
          return null;
        }
      case LoadState.failed:
        //remove memory cached
        state.imageProvider.evict();
        return _buildErrorView();
    }
  }

  Widget _buildPageView() => ExtendedImageGesturePageView.builder(
        controller: widget.controller,
        itemCount: widget.picList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildChildView(index);
        },
        onPageChanged: (int index) {
          _currentIndex = index;
          globalKey.currentState?.update();
        },
      );

  Widget _buildToolsBtn({Function()? onDownload}) => Positioned(
       bottom: 100.h,
       right: (ScreenUtil().screenWidth-100.w)/2,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onDownload,
              child: Container(
                width: 120.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Color(0xFFFFFFFF).withOpacity(0.23),
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30.w),
                ),
                child: Text(
                 "下载",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildBackBtn({Function()? onTap}) => Positioned(
        top: 65.h,
        left: 30.w,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Container(
            width: 70.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: Colors.black26.withOpacity(0.1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.close, color: Colors.white),
          ),
        ),
      );
  Widget _buildNum() => Positioned(
    top: 70.h,
    left: (ScreenUtil().screenWidth-70.w)/2,
    child: Container(
      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 5.w,bottom: 5.w),

     alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Text((_currentIndex+1
          ).toString()+"/"+widget.picList.length.toString(),style: TextStyle(fontSize: 40.sp)),
    ),
  );
  Widget _buildErrorView() => Container(
        width: 375.w,
        color: Color(0xFF999999),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 19.h,
            ),
            Text(
              "图片下载失败",
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            )
          ],
        ),
      );
}

/*
class ChatPicturePreview extends StatelessWidget {
  ChatPicturePreview({
    Key? key,
    required this.picList,
    this.index = 0,
    this.tag,
    this.onDownload,
  })  : this.controller = PageController(initialPage: index),
        super(key: key);
  final List<PicInfo> picList;
  final int index;
  final String? tag;
  final PageController controller;
  final Future<bool> Function(String)? onDownload;

  @override
  Widget build(BuildContext context) {
    var child = Stack(
      children: [
        _buildPageView(),
        _buildBackBtn(onTap: () => Navigator.pop(context)),
        _buildToolsBtn(onDownload: () {
          int index = controller.page?.toInt() ?? 0;
          if (index < picList.length) {
            onDownload?.call(picList.elementAt(index).url!);
          }
        }),
      ],
    );
    return Material(
      color: Color(0xFF000000),
      child: tag == null ? child : Hero(tag: tag!, child: child),
      // child: child,
    );
  }

  ImageProvider? _provider(int index) {
    var info = picList.elementAt(index);
    if (info.file != null) {
      return ExtendedFileImageProvider(info.file!);
    } else if (info.url != null) {
      return CachedNetworkImageProvider(info.url!);
    }
    return null;
  }

  PhotoViewHeroAttributes? _heroTag(int index) {
    var hero = picList.elementAt(index).id ?? tag;
    if (hero != null) {
      return PhotoViewHeroAttributes(tag: hero);
    }
    return null;
  }

  Widget _buildPageView() => Container(
        child: PageView.builder(
          controller: controller,
          itemCount: picList.length,
          onPageChanged: onPageChanged,
          itemBuilder: (_, index) {
            return PhotoView(imageProvider: _provider(index)!);
          },
        ),
        */
/*child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            // return  Image(image:_provider(index)!);
            return PhotoViewGalleryPageOptions(
              imageProvider: _provider(index),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: _heroTag(index),
              errorBuilder: (context, error, stackTrace) => _buildErrorView(),
            );
          },
          itemCount: picList.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            ),
          ),
          // backgroundDecoration: widget.backgroundDecoration,
          pageController: controller,
          onPageChanged: onPageChanged,
        ),*/ /*

      );

  void onPageChanged(int index) {}

  Widget _buildToolsBtn({Function()? onDownload}) => Positioned(
        top: 676.h,
        width: 375.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onDownload,
              child: Container(
                width: 100.w,
                height: 30.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Color(0xFFFFFFFF).withOpacity(0.23),
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  UILocalizations.download,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildBackBtn({Function()? onTap}) => Positioned(
        top: 35.h,
        left: 30.w,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.black87.withOpacity(0.4),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.close, color: Colors.white),
          ),
        ),
      );

  Widget _buildErrorView() => Container(
        width: 375.w,
        color: Color(0xFF999999),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageUtil.error(width: 80.w, height: 70.h),
            SizedBox(
              height: 19.h,
            ),
            Text(
              UILocalizations.picLoadError,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            )
          ],
        ),
      );
}
*/
