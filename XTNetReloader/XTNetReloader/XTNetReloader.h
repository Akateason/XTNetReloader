//
//  XTNetReloader.h
//  Demo_MjRefresh
//
//  Created by TuTu on 15/12/8.
//  Copyright © 2015年 teason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ReloadButtonClickBlock)() ;

@interface XTNetReloader : UIView

/** 标签名称 */
@property (nonatomic, copy) NSString *labelName;
/** 图片 */
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithFrame:(CGRect)frame
                  reloadBlock:(ReloadButtonClickBlock)reloadBlock ;

- (void)showInView:(UIView *)viewWillShow ;
- (void)dismiss ;

@end

