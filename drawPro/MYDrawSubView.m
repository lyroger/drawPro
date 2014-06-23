//
//  MYDrawSubView.m
//  drawPro
//
//  Created by mysoft on 6/23/14.
//  Copyright (c) 2014 mysoft. All rights reserved.
//

#import "MYDrawSubView.h"

@implementation MYDrawSubView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    [self drawWithImage];
//    [self drawWithContext];
    [self drawWithPath];
}

- (void)setDrawImage:(UIImage *)drawImage
{
    _drawImage = drawImage;
    [self setNeedsDisplay];
}
//画图
- (void)drawWithPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 20)];
    [path addLineToPoint:CGPointMake(40, 20)];
    [path addLineToPoint:CGPointMake(20, 0)];
    [[UIColor redColor] setFill];
    [path fill];
    
    [path removeAllPoints];
    path.lineWidth = 20;
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(20, 80)];
    [[UIColor blueColor] set];
    [path stroke];
    
    [path removeAllPoints];
    [path moveToPoint:CGPointMake(10, 80)];
    [path addLineToPoint:CGPointMake(20, 70)];
    [path addLineToPoint:CGPointMake(30, 80)];
    [path fillWithBlendMode:kCGBlendModeClear alpha:0];
    
}
//画图
- (void)drawWithContext
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(context, 0, 20);
    CGContextAddLineToPoint(context, 40, 20);
    CGContextAddLineToPoint(context, 20, 0);
    CGContextFillPath(context);

    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(context, 20);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 20, 80);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 10, 80);
    CGContextAddLineToPoint(context, 20, 70);
    CGContextAddLineToPoint(context, 30, 80);
    CGContextSetBlendMode(context,kCGBlendModeClear);
    CGContextFillPath(context);
    
}

//拆分图片
- (void)drawWithImage
{
    UIImage *drawImage = _drawImage;//[UIImage imageNamed:@"icon_info.png"];
    CGSize  size = [drawImage size];
    CGImageRef left = CGImageCreateWithImageInRect([drawImage CGImage], CGRectMake(0, 0, size.width/2, size.height));
    CGImageRef right = CGImageCreateWithImageInRect([drawImage CGImage], CGRectMake(size.width/2, 0, size.width/2, size.height));

    CGImageRef leftImage = [self flipImage:left];
    CGImageRef rightImage = [self flipImage:right];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, CGRectMake(0, 0, size.width/2, size.height), leftImage);
    CGContextDrawImage(context, CGRectMake(size.width, 0, size.width/2, size.height), rightImage);
}

- (CGImageRef)flipImage:(CGImageRef)imageref
{
    CGSize size = CGSizeMake(CGImageGetWidth(imageref), CGImageGetHeight(imageref));
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height), imageref);
    
    CGImageRef refImage = [UIGraphicsGetImageFromCurrentImageContext() CGImage];

    UIGraphicsEndImageContext();
    
    return refImage;
}
@end
