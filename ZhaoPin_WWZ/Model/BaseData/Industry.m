//
//  Industry.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Industry.h"

@implementation Industry
@synthesize code = _code,text = _text;

-(void)dealloc
{
    self.code = nil;
    self.text = nil;
    [super dealloc];
}
@end
