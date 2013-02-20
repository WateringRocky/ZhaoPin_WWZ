//
//  SmallJobType.h
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmallJobType : NSObject
{
    NSString *_categoryid;
    NSString *_code;
    NSString *_text;
}
@property(nonatomic,retain)NSString *categoryid,*code,*text;
@end
