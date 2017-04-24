//
//  XTNetReloader.h
//
//
//  Created by TuTu on 15/12/8.
//  Copyright © 2015年 teason. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface XTNetReloader : UIView

+ (void)showInView:(UIView *)viewWillShow
       doReRefresh:(void(^)(void))doReRefreshBlock ;

+ (void)dismiss ;

@end

