//
//  XTNetReloader.m
//  Demo_MjRefresh
//
//  Created by TuTu on 15/12/8.
//  Copyright © 2015年 teason. All rights reserved.
//

#define NO_WIFI_WORDS                   @"网络不太顺畅喔~"

float const fontSize_labelshow       = 17.0 ;
float const fontSize_bt              = 15.0 ;

#import "XTNetReloader.h"

@interface XTNetReloader ()
@property (nonatomic,strong) UIImageView *nowifiImgView ;
@property (nonatomic,strong) UILabel *lb ;
@property (nonatomic,strong) UIButton *bt ;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic,copy) ReloadButtonClickBlock reloadButtonClickBlock;
@end

@implementation XTNetReloader

- (void)showInView:(UIView *)viewWillShow {
    [viewWillShow addSubview:self] ;
}
- (void)dismiss {
    [self removeFromSuperview] ;
}
- (instancetype)initWithFrame:(CGRect)frame
                  reloadBlock:(ReloadButtonClickBlock)reloadBlock {
    self = [super initWithFrame:frame];
    if (self) {
        self.reloadButtonClickBlock = reloadBlock ;
        [self setup] ;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews] ;
    
    [self.customView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.nowifiImgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.lb setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bt setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.customView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.customView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.customView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.customView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    [self addConstraints:@[constraint1,constraint2,constraint3,constraint4]];
    
        NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:self.nowifiImgView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.customView attribute:NSLayoutAttributeTop multiplier:1 constant:20];
        NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:self.nowifiImgView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.customView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self addConstraints:@[constraint5,constraint6]];
    //
        NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:self.lb attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.nowifiImgView attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
        NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:self.lb attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self addConstraints:@[constraint7,constraint8]];
    //
        NSLayoutConstraint *constraint9 = [NSLayoutConstraint constraintWithItem:self.bt attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.lb attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
        NSLayoutConstraint *constraint10 = [NSLayoutConstraint constraintWithItem:self.bt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        [self addConstraints:@[constraint9,constraint10]];
}

- (void)setup {
    [self customView];
    [self configure] ;
    [self nowifiImgView] ;
    [self lb] ;
    [self bt] ;
}

- (void)configure {
    self.backgroundColor = [UIColor whiteColor] ;
}

- (UIImageView *)nowifiImgView {
    if (!_nowifiImgView) {
        _nowifiImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"no-wifi"]] ;
        _nowifiImgView.contentMode = UIViewContentModeScaleAspectFit ;
        
                if (![_nowifiImgView superview]) {
                    [self.customView addSubview:_nowifiImgView];
                }
    }
    return _nowifiImgView ;
}

- (UILabel *)lb {
    if (!_lb) {
        _lb = [[UILabel alloc] init] ;
        _lb.text = NO_WIFI_WORDS;;
        _lb.font = [UIFont boldSystemFontOfSize:fontSize_labelshow] ;
        _lb.textAlignment = NSTextAlignmentCenter ;
        _lb.textColor = [UIColor darkGrayColor] ;
        [self.customView addSubview:_lb];
                if (![_lb superview]) {
                    [self.customView addSubview:_lb];
                }
    }
    return _lb ;
}

- (UIButton *)bt {
    if (!_bt) {
        _bt = [[UIButton alloc] init] ;
        [_bt setTitle:@"重新加载" forState:UIControlStateNormal] ;
        [_bt setTitleColor:[UIColor darkGrayColor] forState:0] ;
        _bt.titleLabel.font = [UIFont systemFontOfSize:fontSize_bt] ;
        _bt.layer.cornerRadius = 5.0f ;
        _bt.layer.borderWidth = 1.0f ;
        _bt.layer.borderColor = [UIColor darkGrayColor].CGColor ;
        [_bt addTarget:self action:@selector(reloadButtonClicked) forControlEvents:UIControlEventTouchUpInside] ;
        
                if (![_bt superview]) {
                    [self.customView addSubview:_bt];
                }
    }
    return _bt ;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.nowifiImgView.image = image;
}

- (void)setLableName:(NSString *)lableName {
    _labelName = lableName;
    self.lb.text = lableName;
}

- (void)reloadButtonClicked {
    self.reloadButtonClickBlock() ;
}
- (UIView *)customView {
    if (_customView == nil) {
        _customView = [[UIView alloc] init];
        [self addSubview:_customView];
    }
    return _customView;
}
@end




