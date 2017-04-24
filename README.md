# XTNetReloader
iOS display in Network Error or not connect .  demo.

显示网络故障页面

极简的调用方式
```
    [XTNetReloader showInView:self.view
                  doReRefresh:^{
                       NSLog(@"开始刷新 。。。") ;
                      // 请求 ...
                      
                      // 请求完成后
                      [XTNetReloader dismiss] ;
                   }] ;
```

