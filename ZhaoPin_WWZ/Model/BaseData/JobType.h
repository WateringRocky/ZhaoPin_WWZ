//
//  JobType.h
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmallJobType.h"

@interface JobType : NSObject
{
    NSString *_code;
    NSString *_text;
    NSMutableArray *_smallJobType;
}
@property(nonatomic,retain)NSString *code,*text;
@property(nonatomic,retain)NSMutableArray *smallJobType;
@end
