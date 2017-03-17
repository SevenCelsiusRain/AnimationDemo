//
//  BasicController.m
//  AnimationDemon
//
//  Created by wanc on 2017/3/17.
//  Copyright © 2017年 zdsoft. All rights reserved.
//

#import "BasicController.h"

@interface BasicController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIButton *easeInOutBtn; // 淡入淡出
@property (weak, nonatomic) IBOutlet UIButton *scaleBtn; // 缩放
@property (weak, nonatomic) IBOutlet UIButton *rotationBtn; // 旋转
@property (weak, nonatomic) IBOutlet UIButton *positionBtn; // 平移
@property (weak, nonatomic) IBOutlet UIView *showView;

@property (nonatomic, strong) CABasicAnimation *animation;

@end

@implementation BasicController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private init

- (CABasicAnimation *)animation {
    
    if (!_animation) {
        
        _animation = [CABasicAnimation animation];
        _animation.delegate = self;
        
        // 动画执行时间
        _animation.duration = 2;
        
        // 动画执行速度
//        _animation.speed = 1.2;
        
        // 重复执行次数
//        _animation.repeatCount = 2
        
        // 重复执行时间
//        _animation.repeatDuration = 5;
        
        // 开始时间
//        _animation.beginTime = CACurrentMediaTime() + 3;
        
        // 动画延迟时间
//        _animation.timeOffset = CACurrentMediaTime() + 3.0;
        
        // 动画执行完后是否移除动画，默认为YES
        _animation.removedOnCompletion = NO;
        
        
        /**
             动画动作规则
             
             kCAMediaTimingFunctionLinear 匀速
             kCAMediaTimingFunctionEaseIn 慢进快出
             kCAMediaTimingFunctionEaseOut 快进慢出
             kCAMediaTimingFunctionEaseInEaseOut 慢进慢出 中间加速
             kCAMediaTimingFunctionDefault 默认
         */
        _animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        // 自动回原 设置为YES，动画执行完后会还原到未执行时状态，NO则保持执行后状态
        _animation.autoreverses = YES;
        
        /**
             决定动画非active时间段行为，如开始前、结束后
             
             kCAFillModeRemoved 这个是默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
             
             kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态
             
             kCAFillModeBackwards 在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。
             
             kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态
         */
        _animation.fillMode = kCAFillModeBoth;
    }
    
    return _animation;
}

#pragma mark - button action
// TODO: 动画操作
- (IBAction)animationAction:(UIButton *)sender {
    
    NSArray *nolBtns;
    
    switch (sender.tag) {
        case 0:
            // 淡入淡出
            nolBtns = @[_scaleBtn, _rotationBtn, _positionBtn];
            [self easeInout];
            
            break;
        case 1:
            // 缩放
            nolBtns = @[_easeInOutBtn, _rotationBtn, _positionBtn];
            [self scale];
            
            break;
        case 2:
            // 旋转
            nolBtns = @[_easeInOutBtn, _scaleBtn, _positionBtn];
            [self rotation];
            
            break;
        case 3:
            // 平移
            nolBtns = @[_easeInOutBtn, _scaleBtn, _rotationBtn];
            [self position];
            
            break;

            
        default:
            break;
    }
    
    [self setselBtn:sender nolBtns:nolBtns];
    
}

#pragma mark - private func

// TODO: 淡入淡出
- (void)easeInout {
    
    self.animation.keyPath = @"opacity";
    self.animation.fromValue = @1.0;
    self.animation.toValue = @0.1;
    
    [self.showView.layer addAnimation:self.animation forKey:@"basic"];
}

// TODO: 缩放
- (void)scale {
    
    self.animation.keyPath = @"transform.scale";
    self.animation.fromValue = @1.0;
    self.animation.toValue = @0.1;
    
    [self.showView.layer addAnimation:self.animation forKey:@"basic"];

}

// TODO: 旋转
- (void)rotation {
    
    self.animation.keyPath = @"transform.rotation";
    self.animation.toValue = @(M_PI);
    
    [self.showView.layer addAnimation:self.animation forKey:@"basic"];
}

// TODO: 平移
- (void)position {
    
    self.animation.keyPath = @"position";
    self.animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y + 200)];
    
    [self.showView.layer addAnimation:self.animation forKey:@"basic"];

    
}

- (void)setselBtn:(UIButton *)selBtn nolBtns:(NSArray *)nolBtns {
    
    selBtn.backgroundColor = [UIColor clearColor];
    
    for (UIButton *nolBtn in nolBtns) {
        
        nolBtn.backgroundColor = [UIColor colorWithRed:234/255.f green:140/255.f blue:135/255.f alpha:1];
        
    }
    
}

#pragma mark - CAAnimationDelegate

// 动画开始
- (void)animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"*********%s*******", __func__);
    
}

// 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"------%s-------", __func__);
}

@end
