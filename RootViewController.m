//
//  RootViewController.m
//  WeiBo_Project
//
//  Created by 1007 on 13-11-27.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "RootViewController.h"
#import "Public_Timeline_Weibo.h"
#import "Friends_Timeline_Weibo.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _publicTimelineWeibo = [[Public_Timeline_Weibo alloc] init];
        _frindsTimelineWeibo = [[Friends_Timeline_Weibo alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"微博";
    
    
    //[_publicTimelineWeibo getPublicTimeline];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
