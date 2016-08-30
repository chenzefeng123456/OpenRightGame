//
//  OneViewController.m
//  Practice( LightsOffGame)
//
//  Created by 3014 on 16/6/4.
//  Copyright © 2016年 3014. All rights reserved.
//

#import "OneViewController.h"
#import "ViewController.h"
@interface OneViewController ()
{
    UIImageView *imageView;
    UIImage *image1;
    NSArray *array;
    NSInteger index;
    NSTimer *timer;
    UIButton *button;
}
@end

@implementation OneViewController

- (void)viewDidLoad {
    NSLog(@"我已经出现");
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(90, 340, 150, 50);
    [button setTitle:@"START" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [button addTarget:self action:@selector(nextViewButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(90, 390, 150, 50);
    [button1 setTitle:@"STOP" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:30];
    [button1 addTarget:self action:@selector(stopViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(120, 220, 80, 80);
   
    array = @[[UIImage imageNamed:@"3"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"1"],[UIImage imageNamed:@"0"]];
    imageView.hidden = YES;
//    imageView.animationRepeatCount = 1;
//    imageView.animationImages =array;
//    imageView.animationDuration = 5;
    [self.view addSubview:imageView];
    [self.view addSubview:button];
    
   
}

- (void)button1:(NSTimer *)sender{
    if (index >= 4) {
        ViewController *view = [ViewController new];
        [self presentViewController:view animated:YES completion:nil];
        [sender invalidate];
        imageView.image = nil;
       
        
    }else{
        imageView.image = array[index];
        index++;
       

    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"我将要出现");
    
    imageView.hidden = YES;
    if (index == 4) {
        index = 0;
    }

}

//- (void)viewDidDisappear:(BOOL)animated{
//    NSLog(@"我已经消失");
//     imageView.image = array[0];
//}




- (void)nextViewButton:(UIButton *)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(button1:) userInfo:nil repeats:YES];
    imageView.hidden = NO;
//    [imageView startAnimating];
//    if (imageView.animationImages == array[3]) {
//        ViewController *view = [ViewController new];
//        [self presentViewController:view animated:YES completion:nil];
//    }

}

- (void)stopViewButton:(UIButton *)sender{
    
    [timer invalidate];
    imageView.hidden = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
