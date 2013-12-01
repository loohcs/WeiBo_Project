//
//  Public_Timeline_Weibo.h
//  Weibo_Test-0001
//
//  Created by 1007 on 13-11-26.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiBoContext;
@class WBHTTP_Request_Block;
@interface Public_Timeline_Weibo : NSObject
{
    WBHTTP_Request_Block *statuses;
    WeiBoContext *publicTimelineWeibo;
}
@property (nonatomic, strong)NSArray *public_weibo_arr;//最新公共微博数组
@property (nonatomic, strong)NSDictionary *one_public_weibo;//最新的一条公共微博

- (void)getPublicTimeline;
- (void)getWeiboContex:(NSData *)data;

@end
