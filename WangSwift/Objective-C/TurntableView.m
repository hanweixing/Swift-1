//
//  TurntableView.m
//  WangSwift
//
//  Created by swift on 2017/10/13.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "TurntableView.h"

@interface TurntableView()<CAAnimationDelegate>

@end


@implementation TurntableView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self make_ui];
    }
    return self;
}

#pragma mark - 界面搭建
- (void)make_ui {
    //转盘
    self.rotateImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.rotateImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.rotateImageView.layer.cornerRadius = self.bounds.size.width/2;
    [self addSubview:self.rotateImageView];
    //按钮
    self.playButton = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, CGRectGetWidth(self.bounds)/3, CGRectGetHeight(self.bounds)/3)];
    self.playButton.backgroundColor = [UIColor redColor];
    [self.playButton setTitle:@"开始抽奖" forState:UIControlStateNormal];
    [self.playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.playButton.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetWidth(self.bounds)/2);
    self.playButton.layer.cornerRadius = CGRectGetWidth(self.bounds)/3/2;
    [self.playButton addTarget:self action:@selector(btnTouchup) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.playButton];
    //可能包含装饰背景等：需要做成镂空或者放置在最顶层。此处忽略
    UIImageView *customImageView = [UIImageView new];
    customImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:customImageView];
    //奖池
    self.prizeArray = @[@"100",@"200",@"300",@"400",@"500",@"600",@"700",@"800"];
    //对应图
    self.imagesArray = @[];
    //添加文字及图片
    for (int i = 0; i < 8; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,M_PI * CGRectGetHeight(self.bounds)/8,
                                                                  CGRectGetHeight(self.bounds)/1.3)];
        label.backgroundColor = [UIColor clearColor];
        label.layer.anchorPoint = CGPointMake(0.5, 1);//旋转中心
        label.center = CGPointMake(CGRectGetHeight(self.bounds)/2, CGRectGetHeight(self.bounds)/2);//界面中心点
        label.text = [NSString stringWithFormat:@"%@", self.prizeArray[i]];
        CGFloat angle = M_PI * 2 / 8 * i;//旋转的弧度
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.transform = CGAffineTransformMakeRotation(angle);//旋转平铺
        [self.rotateImageView addSubview:label];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imageView.center = CGPointMake(M_PI * CGRectGetHeight(self.bounds)/8/2, self.bounds.size.width/8*4);
        imageView.backgroundColor = [UIColor blueColor];
        //imageView.image = [UIImage imageNamed:self.imagesArray[i]];
        [label addSubview:imageView];
        
    }
}

#pragma mark - 开始旋转
//传入停留位置：肯定不是随机的 你懂得！!!
- (void)startPlayWithTurnAngle:(NSInteger)turnAngle {
    //0 45 90 135 180 225 270 315 -> 45度一个刻度
    //NSInteger randomNum = arc4random()%100;//控制概率
    NSInteger turnsNum = arc4random()%5+1;//控制圈数:显得真实
    CGFloat perAngle = M_PI/180.0;//单圈
    //旋转动画
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:turnAngle * perAngle + 360 * perAngle * turnsNum];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    //由快变慢
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.rotateImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    // 转盘结束后调用，显示获得的对应奖励
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"动画结束,开始回调");
    if (self.stopBlock) {
        self.stopBlock();
    } else {
        NSLog(@"动画完成代码块未赋值");
    }
}

#pragma mark - 按钮点击以及回调
- (void)btnTouchup {
    if (self.actionBlock) {
        self.actionBlock();
    } else {
        NSLog(@"按钮启动未赋值代码块未赋值");
    }
}

- (void)makeActionBlock:(BtnActionBlock)actionBlock {
    self.actionBlock = actionBlock;
}

- (void)makeStopBlock:(RotateStopBlock)stopBlock {
    self.stopBlock = stopBlock;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
