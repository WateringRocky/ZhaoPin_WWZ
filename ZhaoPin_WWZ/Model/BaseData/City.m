//
//  City.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "City.h"

@implementation City
@synthesize parent = _parent,code = _code,text = _text;

-(void)dealloc
{
    self.parent = nil;
    self.code = nil;
    self.text = nil;
    [super dealloc];
}
@end
