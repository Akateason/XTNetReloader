//
//  XTNetReloader.m
//  
//
//  Created by TuTu on 15/12/8.
//  Copyright © 2015年 teason. All rights reserved.
//
#import "XTNetReloader.h"
#import "Masonry.h"

typedef void(^ReloadButtonClickBlock)() ;

@interface XTNetReloader ()
@property (nonatomic,strong) UIImageView *nowifiImgView ;
@property (nonatomic,strong) UILabel *lb1 ;
@property (nonatomic,strong) UILabel *lb2 ;
@property (nonatomic,strong) UIButton *bt ;
@property (nonatomic,copy) ReloadButtonClickBlock reloadButtonClickBlock ;
- (void)showFrom:(UIView *)viewWillShow ;
- (void)dismiss ;
@end

@interface XTNetReloader ()
+ (XTNetReloader *)shareInstance ;
@end

@implementation XTNetReloader

#pragma mark --
#pragma mark - public

+ (void)showInView:(UIView *)viewWillShow
         doRefresh:(void(^)(void))doRefreshBlock
{    
    [XTNetReloader  shareInstance].reloadButtonClickBlock = ^{
        if (doRefreshBlock) doRefreshBlock() ;
    } ;
    
    [[XTNetReloader shareInstance] showFrom:viewWillShow] ;
}

+ (void)dismiss {
    [[XTNetReloader shareInstance] dismiss] ;
}

#pragma mark --
#pragma mark - private funcs

+ (XTNetReloader *)shareInstance {
    static dispatch_once_t once ;
    static XTNetReloader *singleton ;
    dispatch_once(&once, ^{
        singleton = [[XTNetReloader alloc] init] ;
        [singleton setup] ;
    });
    return singleton ;
}

- (void)showFrom:(UIView *)viewWillShow {
    [viewWillShow addSubview:self] ;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewWillShow) ;
    }] ;
}

- (void)dismiss {
    if (self.superview) [self removeFromSuperview] ;
}

- (void)setup {
    [self configure] ;
    [self nowifiImgView] ;
    [self lb1] ;
    [self lb2] ;
    [self bt] ;
}

- (void)configure {
    self.backgroundColor = [UIColor whiteColor] ;
}

- (UIImageView *)nowifiImgView {
    if (!_nowifiImgView) {
        _nowifiImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noWifi"]] ;
        _nowifiImgView.contentMode = UIViewContentModeScaleAspectFit ;
        if (![_nowifiImgView superview]) {
            [self addSubview:_nowifiImgView] ;
            [_nowifiImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(148 ) ;
                make.size.mas_equalTo(CGSizeMake(64 , 47 )) ;
                make.centerX.equalTo(self) ;
            }] ;
        }
    }
    return _nowifiImgView ;
}

- (UILabel *)lb1 {
    if (!_lb1) {
        _lb1 = [[UILabel alloc] init] ;
        _lb1.text = @"网络请求失败" ;
        _lb1.font = [UIFont systemFontOfSize:17 ] ;
        _lb1.textAlignment = NSTextAlignmentCenter ;
//        _lb1.textColor = [UIColor inputText1] ;
        if (![_lb1 superview]) {
            [self addSubview:_lb1] ;
            [_lb1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self) ;
                make.top.equalTo(self.nowifiImgView.mas_bottom).mas_equalTo(13 ) ;
            }] ;
        }
    }
    return _lb1 ;
}

- (UILabel *)lb2 {
    if (!_lb2) {
        _lb2 = [[UILabel alloc] init] ;
        _lb2.text = @"请检查你的网络" ;
        _lb2.font = [UIFont systemFontOfSize:15 ] ;
        _lb2.textAlignment = NSTextAlignmentCenter ;
//        _lb2.textColor = [UIColor inputText1] ;
        _lb2.alpha = .5 ;
        if (![_lb2 superview]) {
            [self addSubview:_lb2] ;
            [_lb2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self) ;
                make.top.equalTo(self.lb1.mas_bottom).mas_equalTo(7.5 ) ;
            }] ;
        }
    }
    return _lb2 ;
}

- (UIButton *)bt {
    if (!_bt) {
        _bt = [[UIButton alloc] init] ;
        [_bt setTitle:@"重新加载" forState:0] ;
        [_bt setTitleColor:[UIColor lightGrayColor] forState:0] ;
        _bt.titleLabel.font = [UIFont systemFontOfSize:17 ] ;
        _bt.layer.cornerRadius = 5.0f ;
        _bt.layer.borderWidth = 2.0f ;
        _bt.layer.borderColor = [UIColor lightGrayColor].CGColor ;
        [_bt addTarget:self action:@selector(reloadButtonClicked) forControlEvents:UIControlEventTouchUpInside] ;
        if (![_bt superview]) {
            [self addSubview:_bt] ;
            [_bt mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self) ;
                make.size.mas_equalTo(CGSizeMake(102 , 33 )) ;
                make.top.equalTo(self.lb2.mas_bottom).mas_equalTo(37 ) ;
            }] ;
        }
    }
    return _bt ;
}

- (void)reloadButtonClicked {
    if (self.reloadButtonClickBlock) {
        self.reloadButtonClickBlock() ;
    }
}

@end




