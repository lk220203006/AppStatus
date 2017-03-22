iOS的应用程序的生命周期


第一次点击icon启动APP，调用顺序
-[AppDelegate application:willFinishLaunchingWithOptions:]
-[AppDelegate application:didFinishLaunchingWithOptions:]
-[ViewController viewWillAppear:]
-[AppDelegate applicationDidBecomeActive:]
-[ViewController viewDidAppear:]

 点击Home键转后台
-[AppDelegate applicationWillResignActive:]
-[AppDelegate applicationDidEnterBackground:]

再次恢复APP
-[AppDelegate applicationWillEnterForeground:]
-[AppDelegate applicationDidBecomeActive:]