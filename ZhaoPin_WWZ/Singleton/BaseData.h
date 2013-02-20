//
//  BaseData.h
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseData : NSObject
{
    NSMutableArray *_region_city;
    NSMutableArray *_compSize;
    NSMutableArray *_compType;
    NSMutableArray *_industry;
    NSMutableArray *_job_smallJob_type;
    NSMutableArray *_mapRange;
    NSMutableArray *_publishDate;
    NSMutableArray *_education;
    NSMutableArray *_salary;
    NSMutableArray *_employment;
    NSMutableArray *_workEXP;
}
@property(nonatomic,retain)NSMutableArray *region_city,*compSize,*compType,*industry,*job_smallJob_type,*mapRange,*publishDate,*education,*salary,*employment,*workEXP;

+(BaseData *)getDataInstance;
@end
