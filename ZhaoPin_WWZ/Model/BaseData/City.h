//
//  City.h
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
{
    NSString *_parent;
    NSString *_code;
    NSString *_text;
}
@property(nonatomic,retain)NSString *parent,*code,*text;
@end
