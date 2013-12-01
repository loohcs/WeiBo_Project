//
//  Public_Timeline_Weibo.m
//  Weibo_Test-0001
//
//  Created by 1007 on 13-11-26.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Public_Timeline_Weibo.h"
#import "WBHTTP_Request_Block.h"
#import "WeiBoContext.h"

@implementation Public_Timeline_Weibo

#pragma mark -- 请求最新的公共微博
- (void)getPublicTimeline
{
    NSLog(@"%s", __func__);
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"100", @"count", nil];
    statuses = [[WBHTTP_Request_Block alloc] initWithURlString:STATUSES_PUBLIC_TIMELINE andArguments:dic];
    NSLog(@"%@", STATUSES_PUBLIC_TIMELINE);
    publicTimelineWeibo = [[WeiBoContext alloc] init];
    [statuses setBlock:^(NSMutableData *datas, float progressNum)
     {
         //NSString *str = [[NSString alloc] initWithData:datas encoding:NSUTF8StringEncoding];
         //NSLog(@"%@", str);
         
         Public_Timeline_Weibo *publicTimelineClass = [[Public_Timeline_Weibo alloc] init];
         [publicTimelineClass getWeiboContex:datas];
     }];

}

- (void)getWeiboContex:(NSData *)data
{
    NSLog(@"%s", __func__);
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSArray *weiboArr = [NSArray arrayWithArray:[dic objectForKey:@"statuses"]];
    NSDictionary *weiboDic = [NSDictionary dictionaryWithDictionary:[weiboArr objectAtIndex:0]];
    publicTimelineWeibo = [[WeiBoContext alloc] initWithWeibo:weiboDic];
}

@end
