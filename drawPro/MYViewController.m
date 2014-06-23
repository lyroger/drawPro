//
//  MYViewController.m
//  drawPro
//
//  Created by mysoft on 6/23/14.
//  Copyright (c) 2014 mysoft. All rights reserved.
//

#import "MYViewController.h"
#import "MYDrawSubView.h"
@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"iOS绘图";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImage *drawImage = [UIImage imageNamed:@"icon_info.png"];
    CGSize  size = [drawImage size];
    UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, size.width, size.height)];
    imagev.image = drawImage;
    imagev.center = self.view.center;
    [self.view addSubview:imagev];
    [self drawMyImage3:imagev.image];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawMyImage1:(UIImage*)im
{
    UIImage *drawImage = im;
    CGSize  size = [drawImage size];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width*2, size.height), NO, 0);
    [drawImage drawAtPoint:CGPointMake(-size.width/2, 0)];
    [drawImage drawAtPoint:CGPointMake(size.width, 0)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:iv];
    iv.center = self.view.center;
}

- (void)drawMyImage2:(UIImage*)im
{
    UIImage *drawImage = im;
    CGSize  size = [drawImage size];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width*2, size.height*2), NO, 0);
    [drawImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    [drawImage drawInRect:CGRectMake(size.width/2, size.height/2, size.width, size.height) blendMode:kCGBlendModeMultiply alpha:1.0];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:iv];
    iv.center = self.view.center;
}

//拆分图片
- (void)drawMyImage3:(UIImage*)im
{
    MYDrawSubView *view = [[MYDrawSubView alloc] initWithFrame:CGRectMake(0, 64, 320, 416)];
    view.drawImage = im;
    [self.view addSubview:view];
}

@end









