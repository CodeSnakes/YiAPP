# **flutter_app_for_stud**👹

**A Flutter project. also is a demo flutter app for me to learn**

## **Getting Started**

## **改错日志（后面太多了）**
> - **引入image_gallery_saver插件**  
>
>   - **Android run运行 一直卡在  `Running Gradle task ‘assembleDebug‘`**
>
>     **`flutter run -v` 报错  `Could not download kotlin-compiler-embeddable.jar`**
>
>     **下载不到一个 `kotlin-compiler-embeddable-1.3.72 jar` 包**
>
>     **解决网址：https://blog.csdn.net/qq_33721320/article/details/104935041**
>
> - **应用方法超过64K**
>
>   - **解决方式图片红框内所添加** 
>   - <img src="https://gitee.com/yichangkong/FigureBed/raw/master/img/image-20200805000940533.png" alt="image-20200805000940533" style="zoom: 50%;" />
>
> - 等等
>
>   

## **高德地图嵌入**

> 1.  **SDK选择**
>     - **Github : [Click Me](https://github.com/fluttify-project/amap_map_fluttify.git)**
>     - **SDK installing 按照readme**
> 2.   **获取时高德开发API - key 需注意**
>     - **<img src="https://gitee.com/yichangkong/FigureBed/raw/master/img/image-20200804235211714.png" alt="image-20200804235211714" style="zoom:50%;" />**
>     - **获取发布版安全码SHA1：可查看高德官网提示**
>     - **获取调试版安全码SHA1（不能确定时 可复制Log的报错的sha 进去替换）：也可就复制上面获取的sha1**
>     - **如果进行了真机测试，还是黑屏，只是显示部分的高德地图组件，大概率是key与项目app不匹配**
> 3.  **软件打包部署 签名问题 sing**
>     - **生成方式 cmd 当前项目路径（keytool -genkey -v -keystore c:\Users\USER_NAME\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key）** 
>     - **生成sing问题（注意自己输入时的key 密码 不要只写android）**
>     - <img src="https://gitee.com/yichangkong/FigureBed/raw/master/img/image-20200805000501941.png" alt="image-20200805000501941" style="zoom: 80%;" />
> 4.  **真机运行测试**

