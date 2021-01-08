# **FlutterAppForStud**👹

> **A Flutter project. also is a demo flutter app for me to learn。**

## **Getting Started**

> 暂定

## 项目简介

> 此项目为个人学习flutter开发的一个Demo项目，在部署项目过程中有问题的可以提@Issue。😘
>
> **项目涉及功能点**
>
> - 按钮点击功能
> - 导航栏
> - 下列列表
> - 弹框展示确认
> - 高德地图（需要使用真机测试效果）
> - 二维码生成、扫描、照片扫描
> - 条形码扫描、信息展示
> - 树状图展示
> - 持续更新中

## 主要功能部分

### 初始化页面（暂定）

> 1. 样式展示 
>
>    ![](assets/readmeImg/welcome.gif)
>
> 2. 

### 首页展示（暂定）

> 1. 样式展示
>
>    ![](assets/readmeImg/index.gif)
>
> 2. 

### 高德地图嵌入（未完善）

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
> 5.  **pc端测试（黑屏显示正常，需要真机）**
> 6.  

### 二维码（暂定）

> 

### 树图展示（暂定）

> 

## **改错日志**

> - 有错误的，后面太多了，就少写了很多。
>
> - **项目运行过程中太慢，需要优化（暂定）**
>
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