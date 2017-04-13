//
//  ViewController.m
//  JSRunDemo
//
//  Created by PavanMBP on 3/1/17.
//  Copyright © 2017 flappjack. All rights reserved.
//

#import "ViewController.h"
#import "Lesson1ViewController.h"


@interface ViewController ()<UIWebViewDelegate>

{
    UIWebView *viewWeb;
    UIButton *Lesson1button;
    UIButton *Lesson1_2button;
    UIButton *Lesson1_3button;
    UIButton *Lesson2button;
    UIButton *Lesson3button;
    NSUserDefaults *ud;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ud = [NSUserDefaults standardUserDefaults];
    
    Lesson1button = [[UIButton alloc]init];
    Lesson1button.frame = CGRectMake(350, 150, 320, 50);
    [Lesson1button setTitle:@"Lesson 1" forState:UIControlStateNormal];
    [Lesson1button.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [Lesson1button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Lesson1button setBackgroundColor:[UIColor greenColor]];
    [Lesson1button addTarget:self action:@selector(Lesson1action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Lesson1button];

    Lesson1_2button = [[UIButton alloc]init];
    Lesson1_2button.frame = CGRectMake(350, 250, 320, 50);
    [Lesson1_2button setTitle:@"Lesson 1-2" forState:UIControlStateNormal];
    [Lesson1_2button.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [Lesson1_2button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Lesson1_2button addTarget:self action:@selector(Lesson1_2action) forControlEvents:UIControlEventTouchUpInside];
    [Lesson1_2button setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:Lesson1_2button];
    
    Lesson1_3button = [[UIButton alloc]init];
    Lesson1_3button.frame = CGRectMake(350, 350, 320, 50);
    [Lesson1_3button setTitle:@"Lesson 1-3" forState:UIControlStateNormal];
    [Lesson1_3button.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [Lesson1_3button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Lesson1_3button addTarget:self action:@selector(Lesson1_3action) forControlEvents:UIControlEventTouchUpInside];
    [Lesson1_3button setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:Lesson1_3button];
    
    Lesson2button = [[UIButton alloc]init];
    Lesson2button.frame = CGRectMake(350, 450, 320, 50);
    [Lesson2button setTitle:@"Lesson 2" forState:UIControlStateNormal];
    [Lesson2button.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [Lesson2button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Lesson2button addTarget:self action:@selector(Lesson2action) forControlEvents:UIControlEventTouchUpInside];
    [Lesson2button setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:Lesson2button];

    
    Lesson3button = [[UIButton alloc]init];
    Lesson3button.frame = CGRectMake(350, 550, 320, 50);
    [Lesson3button setTitle:@"Lesson 3" forState:UIControlStateNormal];
    [Lesson3button.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [Lesson3button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Lesson3button addTarget:self action:@selector(Lesson3action) forControlEvents:UIControlEventTouchUpInside];
    [Lesson3button setBackgroundColor:[UIColor magentaColor]];
    [self.view addSubview:Lesson3button];
}

-(void)Lesson1action
{
    NSLog(@"Lesson1");
    [ud setObject:@"lesson1" forKey:@"lesson"];
    Lesson1ViewController *l1vc = [[Lesson1ViewController alloc]init];
    [self presentViewController:l1vc animated:YES completion:nil];
}

-(void)Lesson1_2action
{
    NSLog(@"Lesson1");
    [ud setObject:@"lesson1-2" forKey:@"lesson"];
    Lesson1ViewController *l1vc = [[Lesson1ViewController alloc]init];
    [self presentViewController:l1vc animated:YES completion:nil];
}

-(void)Lesson1_3action
{
    NSLog(@"Lesson1");
    [ud setObject:@"lesson1-3" forKey:@"lesson"];
    Lesson1ViewController *l1vc = [[Lesson1ViewController alloc]init];
    [self presentViewController:l1vc animated:YES completion:nil];
}



-(void)Lesson2action
{
    NSLog(@"Lesson2");
    [ud setObject:@"lesson2" forKey:@"lesson"];
    Lesson1ViewController *l1vc = [[Lesson1ViewController alloc]init];
    [self presentViewController:l1vc animated:YES completion:nil];
}

-(void)Lesson3action
{
    NSLog(@"Lesson3");
    [ud setObject:@"lesson3" forKey:@"lesson"];
    Lesson1ViewController *l1vc = [[Lesson1ViewController alloc]init];
    [self presentViewController:l1vc animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
