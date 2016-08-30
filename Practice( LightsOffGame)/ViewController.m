

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "OneViewController.h"
@interface ViewController ()
{
    UIButton *button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor cyanColor];
    for (int i= 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
           button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake( 5 + j *65, 30 + i*65, 50, 50);
            [button setBackgroundImage:[UIImage imageNamed:@"timg.jpg"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"18347945_003857636000_2.jpg"] forState:UIControlStateSelected];
            button.backgroundColor = [UIColor redColor];
            
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 30;
            [self.view addSubview:button];
            [button addTarget:self action:@selector(gameBegin:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 150 + 10 * i + j;
         
        
//            button.backgroundColor = [UIColor redColor];
        
        }
    }
    UIButton  *recoverButton = [UIButton buttonWithType:UIButtonTypeSystem];
    recoverButton.frame = CGRectMake(15, 500, 80, 44);
    [recoverButton setTitle:@"还原" forState:UIControlStateNormal];
    [self.view addSubview:recoverButton];
    recoverButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [recoverButton addTarget:self action:@selector(recoverButton:) forControlEvents:UIControlEventTouchUpInside];
    recoverButton.tag = 10086;
    
    UIButton *backViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backViewButton.frame = CGRectMake(230, 500, 80, 44);
    backViewButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [backViewButton addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    [backViewButton setTitle:@"退出" forState:UIControlStateNormal];
    [self.view addSubview:backViewButton];
    backViewButton.tag = 10089;

}

- (void)backView:(UIButton *)sender{
   // OneViewController *one = [OneViewController new];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)recoverButton:(UIButton *)sender{
    for (UIButton *btn in self.view.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.selected = NO;
            
            if (btn.tag!=10086 && btn.tag != 10089) {

                btn.backgroundColor = [UIColor redColor];
            }
        }
    }
}
- (void)gameBegin:(UIButton *)sender{
    sender.selected = !sender.selected;
    UIButton *upButton = (UIButton *)[self.view viewWithTag:sender.tag - 10];
    UIButton *downButton = (UIButton *)[self.view viewWithTag:sender.tag +10];
    UIButton *leftButton = (UIButton *)[self.view viewWithTag:sender.tag  - 1];
    UIButton *rightButton =(UIButton *)[self.view viewWithTag:sender.tag + 1];
    upButton.selected = !upButton.selected;
    downButton.selected = !downButton.selected;
    leftButton.selected = !leftButton.selected;
    rightButton.selected = !rightButton.selected;

//    sender.backgroundColor = sender.selected?[UIColor greenColor]:[UIColor redColor];
//    upButton.backgroundColor = upButton.selected?[UIColor greenColor]:[UIColor redColor];
//    downButton.backgroundColor = downButton.selected?[UIColor greenColor]:[UIColor redColor];
//    leftButton.backgroundColor = leftButton.selected?[UIColor greenColor]:[UIColor redColor];
//    rightButton.backgroundColor = rightButton.selected?[UIColor greenColor]:[UIColor redColor];
    
    AudioServicesPlaySystemSound(1001);

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
