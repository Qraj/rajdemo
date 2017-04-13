//
//  Lesson1ViewController.m
//  JSRunDemo
//
//  Created by PavanMBP on 3/3/17.
//  Copyright © 2017 flappjack. All rights reserved.
//

#import "Lesson1ViewController.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <JavaScriptCore/JSContext.h>
#import <JavaScriptCore/JSExport.h>
#import <JavaScriptCore/JSValue.h>
#import <objc/runtime.h>

@protocol ButtonExport <JSExport>

- (void) setOnClickListener:(JSValue*)handler;

@end

@protocol LabelExport <JSExport>

-(void)setText:(NSString*)text;

@end

@interface Lesson1ViewController ()<UIWebViewDelegate,WKNavigationDelegate>

{
//    UIButton *bsckbutton;
//    NSUserDefaults *ud;
//    UIWebView *viewWeb;
    
}

@property (nonatomic) JSContext* context;
@property (nonatomic) NSDate* lastLoad;


@end

@implementation Lesson1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self setupProtocols];
    [self setupContext];
    [self setup:[[NSBundle mainBundle] pathForResource:@"calc" ofType:@"js"]];
    
    // Poll for changes in the JavaScript
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkReload) userInfo:nil repeats:YES];

    
//    ud = [NSUserDefaults standardUserDefaults];
//    
//    viewWeb = [[UIWebView alloc]initWithFrame:self.view.bounds];
//    viewWeb.delegate = self;
//    [self.view addSubview:viewWeb];
//
//
//    NSURL *url;
//    
//    NSLog(@"Value for lesson befor call is : %@",[ud objectForKey:@"lesson"]);
//    
//    if ([[ud objectForKey:@"lesson"] isEqualToString:@"lesson1"])
//    {
//        NSLog(@"Into Lesson 1");
//        url = [NSURL URLWithString:@"http://192.168.0.100/ipad-Test-Html/Lesson1"];
//    }
//    else if ([[ud objectForKey:@"lesson"] isEqualToString:@"lesson2"])
//    {
//        NSLog(@"Into Lesson 2");
////        address = @"http://192.168.0.100/ipad-Test-Html/Lesson1";
//    }
//    else if ([[ud objectForKey:@"lesson"] isEqualToString:@"lesson3"])
//    {
//        NSLog(@"Into Lesson 3");
////        address = @"http://192.168.0.100/ipad-Test-Html/Lesson1";
//    }
//    else if ([[ud objectForKey:@"lesson"] isEqualToString:@"lesson1-2"])
//    {
//        NSLog(@"Into Lesson 1-2");
////        address = @"http://192.168.0.100/ipad-Test-Html/Lesson1";
//    }
//    else
//    {
//        NSLog(@"Into Lesson 1-3");
////        address = @"http://192.168.0.100/ipad-Test-Html/Lesson1";
//
//    }
    
    // Build the url and loadRequest
//    NSString *urlString = [NSString stringWithFormat:@"%@",address];
//    [viewWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [viewWeb loadRequest:request];
//    
//    
//    
//    
//    bsckbutton = [[UIButton alloc]init];
//    bsckbutton.frame = CGRectMake(20, 20, 100, 50);
//    [bsckbutton setTitle:@"Back" forState:UIControlStateNormal];
//    [bsckbutton.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
//    [bsckbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [bsckbutton addTarget:self action:@selector(backbuttonaction) forControlEvents:UIControlEventTouchUpInside];
//    [bsckbutton setBackgroundColor:[UIColor greenColor]];
//    [viewWeb addSubview:bsckbutton];
    

}


-(void)setup:(NSString*)source {
    //load the cross-platform javascript
    NSString* js = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:source] encoding:NSUTF8StringEncoding];
    [self.context evaluateScript:js];
    [self checkException];
    
    //make its calculator object easily accessible to objective C
//    self.calculator = self.context[@"calculator"];
    
    self.lastLoad = [NSDate new];
}

-(void)checkException {
    if (self.context.exception) {
        NSLog(@"js exception: %@", self.context.exception);
    }
    
    self.context.exception = nil;
}

-(void) setupProtocols {
    //existing classes need a protocol added to expose API to javascript
    Protocol* newProtocol = @protocol(ButtonExport);
    class_addProtocol([UIButton class], newProtocol);
    
    newProtocol = @protocol(LabelExport);
    class_addProtocol([UILabel class], newProtocol);
}

-(void) setupContext {
    // Expose our objects to JavaScript
    self.context = [[JSContext alloc] init];
    
    // We can't set console.log in the context directly, only top-level objects, so let's build a top-level dummy object for console using a block
    
    JSValue* console = [JSValue valueWithNewObjectInContext:self.context];
    console[@"log"] = ^void(NSString* string) {
        NSLog(@"js: %@", string);
    };
    self.context[@"console"] = console;
}

-(void)backbuttonaction
{
//    [ud setObject:@"" forKey:@"lesson"];
//    NSLog(@"Value for lesson is : %@",[ud objectForKey:@"lesson"]);
    [self dismissViewControllerAnimated:YES completion:nil];
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
