//
//  QiAnimationViewController.m
//  QiFirstTasteOfAnimation
//
//  Created by QiShare on 2018/8/22.
//  Copyright © 2018年 QiShare. All rights reserved.
//

#import "QiAnimationViewController.h"

@implementation QiAnimationViewController{
    
    UILabel *_basicAniLabel; //!> 用于展示基础动画的label
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Private functions

- (void)setupUI {
    
    _basicAniLabel = [[UILabel alloc] initWithFrame:CGRectMake(.0, .0, 320.0, 320.0)];
    [self.view addSubview:_basicAniLabel];
    _basicAniLabel.center = self.view.center;
    _basicAniLabel.text = @"Q·i Share";
    _basicAniLabel.textAlignment = NSTextAlignmentCenter;
    _basicAniLabel.font = [UIFont boldSystemFontOfSize:36.0];
    _basicAniLabel.textColor = [UIColor yellowColor];
    _basicAniLabel.layer.borderWidth = 40.0;
    _basicAniLabel.layer.borderColor = [UIColor blueColor].CGColor;
    _basicAniLabel.layer.backgroundColor = [UIColor redColor].CGColor;
    
    _basicAniLabel.layer.shadowOffset = CGSizeZero;
    _basicAniLabel.layer.shadowRadius = 30.0;
    _basicAniLabel.layer.shadowColor = [UIColor yellowColor].CGColor;
    _basicAniLabel.layer.shadowOpacity = 1.0;
}

- (void)basicAnimation {

    CABasicAnimation *backColorBasAni = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backColorBasAni.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    backColorBasAni.toValue = (__bridge id _Nullable)([UIColor purpleColor].CGColor);
    [_basicAniLabel.layer addAnimation:backColorBasAni forKey:@"backgroundColor"];
    
    CABasicAnimation *borderColorBasAni = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColorBasAni.fromValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    borderColorBasAni.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    
    CABasicAnimation *borderWidthBasAni = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    borderWidthBasAni.fromValue = @(_basicAniLabel.layer.borderWidth);
    borderWidthBasAni.toValue = @(20.0);
    
    CABasicAnimation *opacityBasAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityBasAni.fromValue = @(1.0);
    opacityBasAni.toValue = @(0.2);
    
    _basicAniLabel.layer.masksToBounds = YES;
    CABasicAnimation *CornerRadiusBasAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    CornerRadiusBasAni.fromValue = @(_basicAniLabel.layer.cornerRadius);
    CornerRadiusBasAni.toValue = @(40.0);
    
    CABasicAnimation *transformScaleBasAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    transformScaleBasAni.fromValue = @(1.0);
    transformScaleBasAni.toValue = @(0.6);
   
    CABasicAnimation *shadowRadiusBasAni = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    shadowRadiusBasAni.fromValue = @(_basicAniLabel.layer.shadowRadius);
    shadowRadiusBasAni.toValue = @(4.0);
    
    CABasicAnimation *shadowColorBasAni = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    shadowColorBasAni.fromValue = (__bridge id _Nullable)([UIColor yellowColor].CGColor);
    shadowColorBasAni.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    
    CABasicAnimation *shadowOpacityBasAni = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    shadowOpacityBasAni.fromValue = @(1.0);
    shadowOpacityBasAni.toValue = @(0.6);
    
    CABasicAnimation *rotateXBasAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateXBasAni.duration = 3.0;
    rotateXBasAni.fromValue = @(0);
    rotateXBasAni.toValue = @(M_PI * 2.0);
    [_basicAniLabel.layer addAnimation:rotateXBasAni forKey:@"transform.rotation.x"];
    
    CABasicAnimation *rotateYBasAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateYBasAni.duration = 3.0;
    rotateYBasAni.fromValue = @(0);
    rotateYBasAni.toValue = @(M_PI * 2.0);
     [_basicAniLabel.layer addAnimation:rotateYBasAni forKey:@"transform.rotation.y"];
    
    CABasicAnimation *rotateZBasAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateZBasAni.duration = 3.0;
    rotateZBasAni.fromValue = @(0);
    rotateZBasAni.toValue = @(M_PI * 2);
     [_basicAniLabel.layer addAnimation:rotateZBasAni forKey:@"transform.rotation.z"];
    
    // 使用组动画的形式可按如下来写
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.removedOnCompletion = NO;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.animations = @[backColorBasAni,borderColorBasAni,borderWidthBasAni,shadowOpacityBasAni,shadowColorBasAni,shadowRadiusBasAni];
    animaGroup.animations = @[backColorBasAni,borderColorBasAni,borderWidthBasAni, CornerRadiusBasAni, shadowOpacityBasAni,shadowColorBasAni,shadowRadiusBasAni,transformScaleBasAni];
    animaGroup.duration = 3.0;
    [_basicAniLabel.layer addAnimation:animaGroup forKey:nil];
}


#pragma mark - Private functions

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.view.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view.userInteractionEnabled = YES;
    });
    [self basicAnimation];
}

- (void)readMe {
    /**
     *  文章样式方面温馨提示：
     命名上basicAnimation 简写为basAni
     basAni.duration = 3.0;
     basAni.removedOnCompletion = NO;
     basAni.fillMode = kCAFillModeForwards;
     backgroundColor、borderColor、borderWidth、cornerRadius、transform.scale、shadowRadius、shadowColor、shadowOpacity、transform.rotation.x、transform.rotation.y、transform.rotation.z
     *注意点:
     * 使用 animationWithKeyPath: 对应的参数一定要写对(包括大小写) 否则就无法出现预期效果
     * 注意设置shadowOffset的值 可以设置为CGSizeZero
     * 通过去改变shadowCornerRadius来 达到四周都有阴影的效果
     * 可以使用组动画的形式来做这件事(如果可以达到预期，个人建议这种方式)
     * 也可以一个个的添加动画
     */
}

@end
