# swift3.0-CreatFrameworkDemo
1. 创建framework的Demo，参考文档：<br>
<a href="https://www.raywenderlich.com/126365/ios-frameworks-tutorial" target="view_window">Creating and Distributing iOS Frameworks</a><br>
<a href="http://blog.csdn.net/dcw050505/article/details/53122956" target="view_window">Xcode8.0 制作.framework</a><br>
<br><br>
标注说明：<br>
1.在设置Link With Standard Libraries 和 Mach-O Type 参数时，swift不支持Static Libraries<br>
(然后将Link With Standard Libraries关闭，我想可能是为了避免重复链接.
最后将Mach-O Type设为Static Library，framework可以是动态库也可以是静态库，对于系统的framework是动态库，而用户制作的framework只能是静态库。)<br>
2.确保Build Phases 中的headers包含你使用的类<br>
3.在project项目中build Setting -> other Linker Flags ,设置-ObjC,我认为framework与项目之间还是通过OC通信的，<br>
