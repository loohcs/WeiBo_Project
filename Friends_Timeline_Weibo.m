//
//  Friends_Timeline_Weibo.m
//  Weibo_Test-0001
//
//  Created by 1007 on 13-11-28.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Friends_Timeline_Weibo.h"

#import "WBHTTP_Request_Block.h"
#import "WeiBoContext.h"
@implementation Friends_Timeline_Weibo

- (void)getFriendsTimelineWeibo
{
    NSLog(@"%s", __func__);
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"since_id", @"0", @"max_id", @"10",@"count", @"1", @"page", @"0", @"base_app", @"0",@"feature", @"0", @"trim_user", nil];
    statuses = [[WBHTTP_Request_Block alloc] initWithURlString:STATUSES_FRIENDS_TIMELINES andArguments:dic];
    NSLog(@"%@", STATUSES_FRIENDS_TIMELINES);
    _friendsWeiboContext = [[WeiBoContext alloc] init];
    [statuses setBlock:^(NSMutableData *datas, float progressNum)
     {
         //NSString *str = [[NSString alloc] initWithData:datas encoding:NSUTF8StringEncoding];
         //NSLog(@"%@", str);
         
         Friends_Timeline_Weibo *friendWeiboClass = [[Friends_Timeline_Weibo alloc] init];
         [friendWeiboClass getWeiboContex:datas];
     }];
}

- (void)getWeiboContex:(NSData *)data
{
    NSLog(@"%s", __func__);
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSArray *weiboArr = [NSArray arrayWithArray:[dic objectForKey:@"statuses"]];
    NSDictionary *weiboDic = [NSDictionary dictionaryWithDictionary:[weiboArr objectAtIndex:0]];
    _friendsWeiboContext = [[WeiBoContext alloc] initWithWeibo:weiboDic];
}

@end
