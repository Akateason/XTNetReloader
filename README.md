# XTNetReloader
iOS display in Network Error or not connect .  demo.

# 显示网络故障页面的封装

### 极简的调用方式
* 只需传入两个参数
1. 所在的view
2. 刷新动作block.(通常是请求)

* 在请求完成时调用dismiss

```
    [XTNetReloader showInView:self.view
                  doReRefresh:^{
                       NSLog(@"开始刷新 。。。") ;
                      // 请求 ...
                      
                      // 请求完成后
                      [XTNetReloader dismiss] ;
                   }] ;
```
![img](http://upload-images.jianshu.io/upload_images/838591-2c06e032fc68ed34.jpg?imageMogr2/auto-orient/strip%7CimageView2/2)

