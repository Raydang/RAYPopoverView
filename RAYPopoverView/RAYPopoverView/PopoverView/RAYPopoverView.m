//
//  RAYPopoverView.m
//  RAYPopoverView
//
//  Created by richerpay on 15/6/2.
//  Copyright (c) 2015年 richerpay. All rights reserved.
//

#import "RAYPopoverView.h"
#import <QuartzCore/QuartzCore.h>
@interface RAYPopoverView () {
    
    CGPoint bubbleStartPoint;
    CGRect  bubbleFrame;
}

@property (nonatomic, strong)   UIView *customView;
@property (nonatomic, assign)   CGRect targetFrame;
@property (nonatomic, assign)   RAYPopoverOrientations popoverOrientation;
@property (nonatomic, assign)   RAYPopoverStyles popoverStyle;


@end

@implementation RAYPopoverView

#define TargetAndTipSpace 5.0f
#define BoxAndBubbleSpace 1.0f
#define BubbleAndCustomViewSpace 10.0f

#define TipWidth 18.0f
#define TipHeight 12.0f

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    bubbleFrame = CGRectMake(40,240,240,240);
    bubbleStartPoint = CGPointMake(125,2);
    
    
    float radius = (bubbleFrame.size.width + bubbleFrame.size.height) * 0.025;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, BoxAndBubbleSpace);
    
    CGContextMoveToPoint(context, bubbleStartPoint.x, bubbleStartPoint.y);
    
    CGContextAddLineToPoint(context, bubbleStartPoint.x + TipHeight, bubbleStartPoint.y + TipWidth);
    
    CGContextAddLineToPoint(context, bubbleFrame.size.width - BoxAndBubbleSpace - radius, bubbleStartPoint.y + TipWidth);
    CGContextAddArc(context, bubbleFrame.size.width - BoxAndBubbleSpace - radius, bubbleStartPoint.y + TipWidth + radius, radius, -0.5 * M_PI, 0.0, 0);
    
    CGContextAddLineToPoint(context, bubbleFrame.size.width - BoxAndBubbleSpace, bubbleFrame.size.height - BoxAndBubbleSpace - radius);
    CGContextAddArc(context, bubbleFrame.size.width - BoxAndBubbleSpace - radius, bubbleFrame.size.height - BoxAndBubbleSpace - radius, radius, 0.0, 0.5 * M_PI, 0);
    
    CGContextAddLineToPoint(context, BoxAndBubbleSpace + radius, bubbleFrame.size.height - BoxAndBubbleSpace);
    CGContextAddArc(context, BoxAndBubbleSpace + radius, bubbleFrame.size.height - BoxAndBubbleSpace - radius, radius, 0.5 * M_PI, M_PI, 0);
    
    CGContextAddLineToPoint(context, BoxAndBubbleSpace, bubbleStartPoint.y + TipWidth + radius);
    CGContextAddArc(context, BoxAndBubbleSpace + radius, bubbleStartPoint.y + TipWidth + radius, radius, M_PI, 1.5 * M_PI, 0);
    
    CGContextAddLineToPoint(context, bubbleStartPoint.x - TipHeight, bubbleStartPoint.y + TipWidth);
    
    CGContextAddLineToPoint(context, bubbleStartPoint.x, bubbleStartPoint.y);
    
    CGContextClosePath(context);

    CGContextSetRGBFillColor(context, 0.6f, 0.f, 0.f, 0.5f);
    CGContextDrawPath(context, kCGPathFill);


}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor redColor
//                                ];
        
        self.frame = CGRectMake(40,240,240,240);
        self.customView.frame = CGRectMake(22,31,214,200);
//        self.customView.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    RAYPopoverView *result = (RAYPopoverView *)[super hitTest:point withEvent:event];
    
    if (result == nil) {
        [self disappear];
    }
    
    return result;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL result = [super pointInside:point withEvent:event];
    
    return result;
}


- (void)presentFromRect:(CGRect)rect
                 inView:(UIView *)containerView
         tipOrientation:(RAYPopoverOrientations)orientation
               tipStyle:(RAYPopoverStyles)style {

    [containerView addSubview:self];
    [self addSubview:self.customView];
    self.layer.opacity = 0.0f;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(popAnimationDidStop:finished:context:)];
    [UIView setAnimationDuration:0.4f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    self.layer.opacity = 1.0f;

    [UIView commitAnimations];
    [self setNeedsDisplay];
    
}

- (void)presentFromBarButtonItem:(UIBarButtonItem *)item
                  tipOrientation:(RAYPopoverOrientations)orientation
                        tipStyle:(RAYPopoverStyles)style {

}

- (void)disappear {
    
    [self removeFromSuperview];
}
- (void)popAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    self.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

-(UIView *)customView{
    if(_customView == nil){
        _customView = [[UIView alloc]init];
        
    }
    return _customView;

}



@end
