//
//  BaseData.m
//  ZhaoPin_WWZ
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "BaseData.h"
#import "XMLReader.h"
#import "Region.h"
#import "City.h"
#import "CompSize.h"
#import "CompType.h"
#import "Industry.h"
#import "JobType.h"
#import "SmallJobType.h"
#import "MapRange.h"
#import "PublishDate.h"
#import "Education.h"
#import "Salary.h"
#import "Employment.h"
#import "WorkEXP.h"

static BaseData *dataInstance = nil;

@interface BaseData (myInit)
-(BaseData *)initAnInstance;
@end

@implementation BaseData
@synthesize region_city = _region_city,compSize = _compSize,compType = _compType,industry = _industry,job_smallJob_type = _job_smallJob_type,mapRange = _mapRange,publishDate = _publishDate,education = _education,salary = _salary,employment = _employment,workEXP = _workEXP;

-(BaseData *)initAnInstance
{
    if(self = [super init]){
        self.region_city = [[NSMutableArray alloc] init];
        self.compSize = [[NSMutableArray alloc] init];
        self.compType = [[NSMutableArray alloc] init];
        self.industry = [[NSMutableArray alloc] init];
        self.job_smallJob_type = [[NSMutableArray alloc] init];
        self.mapRange = [[NSMutableArray alloc] init];
        self.publishDate = [[NSMutableArray alloc] init];
        self.education = [[NSMutableArray alloc] init];
        self.salary = [[NSMutableArray alloc] init];
        self.employment = [[NSMutableArray alloc] init];
        self.workEXP = [[NSMutableArray alloc] init];
    }
    return self;
}

+(BaseData *)getDataInstance
{
    if(dataInstance == nil){
        dataInstance = [[BaseData alloc] initAnInstance];
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"basedata" ofType:@"xml"];
        NSString *xmlStr = [NSString stringWithContentsOfFile:dataPath encoding:NSUTF8StringEncoding error:nil];
        NSDictionary *allDic = [XMLReader dictionaryForXMLString:xmlStr error:nil];
        NSDictionary *rootDic = [allDic valueForKey:@"root"];
        NSDictionary *basedataDic = [rootDic valueForKey:@"basedata"];
        NSDictionary *cityDic = [basedataDic valueForKey:@"city"];
        NSDictionary *firstLvlDic = [cityDic valueForKey:@"firstLevel"];
        NSDictionary *secondLvlDic = [cityDic valueForKey:@"secondLevel"];
        NSArray *regionArr = [firstLvlDic valueForKey:@"item"];
        NSArray *cityArr = [secondLvlDic valueForKey:@"item"];
        for(NSDictionary *regionDic in regionArr){
            Region *region = [[Region alloc] init];
            region.code = [regionDic valueForKey:@"code"];
            region.text = [regionDic valueForKey:@"text"];
            for(NSDictionary *city_region_Dic in cityArr){
                NSString *parentStr = [city_region_Dic valueForKey:@"parent"];
                if([parentStr isEqualToString:region.code]){
                    City *city = [[City alloc] init];
                    city.parent = [city_region_Dic valueForKey:@"parent"];
                    city.code = [city_region_Dic valueForKey:@"code"];
                    city.text = [city_region_Dic valueForKey:@"text"];
                    [region.city addObject:city];
                    [city release];
                }
            }
            [dataInstance.region_city addObject:region];
            [region release];
        }
        NSDictionary *compSizeDic = [basedataDic valueForKey:@"compsize"];
        NSArray *compSizeArr = [compSizeDic valueForKey:@"item"];
        for(NSDictionary *dic in compSizeArr){
            CompSize *compSize = [[CompSize alloc] init];
            compSize.code = [dic valueForKey:@"code"];
            compSize.text = [dic valueForKey:@"text"];
            [dataInstance.compSize addObject:compSize];
            [compSize release];
        }
        NSDictionary *compTypeDic = [basedataDic valueForKey:@"comptype"];
        NSArray *compTypeArr = [compTypeDic valueForKey:@"item"];
        for(NSDictionary *dic in compTypeArr){
            CompType *compType = [[CompType alloc] init];
            compType.code = [dic valueForKey:@"code"];
            compType.text = [dic valueForKey:@"text"];
            [dataInstance.compType addObject:compType];
            [compType release];
        }
        NSDictionary *industryDic = [basedataDic valueForKey:@"industry"];
        NSArray *industryArr = [industryDic valueForKey:@"item"];
        for(NSDictionary *dic in industryArr){
            Industry *industry = [[Industry alloc] init];
            industry.code = [dic valueForKey:@"code"];
            industry.text = [dic valueForKey:@"text"];
            [dataInstance.industry addObject:industry];
            [industry release];
        }
        NSDictionary *jobTypeDic = [basedataDic valueForKey:@"jobtype"];
        NSDictionary *smallJobTypeDic = [basedataDic valueForKey:@"small_Job_type"];
        NSArray *jobTypeArr = [jobTypeDic valueForKey:@"item"];
        NSArray *smallJobTypeArr = [smallJobTypeDic valueForKey:@"item"];
        for(NSDictionary *jobDic in jobTypeArr){
            JobType *jobType = [[JobType alloc] init];
            jobType.code = [jobDic valueForKey:@"code"];
            jobType.text = [jobDic valueForKey:@"text"];
            for(NSDictionary *smallDic in smallJobTypeArr){
                NSString *categoryid = [smallDic valueForKey:@"categoryid"];
                if([categoryid isEqualToString:jobType.code]){
                    SmallJobType *smallJobType = [[SmallJobType alloc] init];
                    smallJobType.categoryid = [smallDic valueForKey:@"categoryid"];
                    smallJobType.code = [smallDic valueForKey:@"code"];
                    smallJobType.text = [smallDic valueForKey:@"text"];
                    [jobType.smallJobType addObject:smallJobType];
                    [smallJobType release];
                }
            }
            if(jobType.smallJobType.count > 0){
                [jobType.smallJobType removeObjectAtIndex:0];
            }
            [dataInstance.job_smallJob_type addObject:jobType];
            [jobType release];
        }
        NSDictionary *mapRangeDic = [basedataDic valueForKey:@"map_range"];
        NSArray *mapRangeArr = [mapRangeDic valueForKey:@"item"];
        for(NSDictionary *dic in mapRangeArr){
            MapRange *mapRange = [[MapRange alloc] init];
            mapRange.code = [dic valueForKey:@"code"];
            mapRange.text = [dic valueForKey:@"text"];
            [dataInstance.mapRange addObject:mapRange];
            [mapRange release];
        }
        NSDictionary *publishDateDic = [basedataDic valueForKey:@"publishDate"];
        NSArray *publishDateArr = [publishDateDic valueForKey:@"item"];
        for(NSDictionary *dic in publishDateArr){
            PublishDate *publishDate = [[PublishDate alloc] init];
            publishDate.code = [dic valueForKey:@"code"];
            publishDate.text = [dic valueForKey:@"text"];
            [dataInstance.publishDate addObject:publishDate];
            [publishDate release];
        }
        NSDictionary *educationDic = [basedataDic valueForKey:@"education"];
        NSArray *educationArr = [educationDic valueForKey:@"item"];
        for(NSDictionary *dic in educationArr){
            Education *education = [[Education alloc] init];
            education.code = [dic valueForKey:@"code"];
            education.text = [dic valueForKey:@"text"];
            [dataInstance.education addObject:education];
            [education release];
        }
        NSDictionary *salaryDic = [basedataDic valueForKey:@"salary"];
        NSArray *salaryArr = [salaryDic valueForKey:@"item"];
        for(NSDictionary *dic in salaryArr){
            Salary *salary = [[Salary alloc] init];
            salary.code = [dic valueForKey:@"code"];
            salary.text = [dic valueForKey:@"text"];
            [dataInstance.salary addObject:salary];
            [salary release];
        }
        NSDictionary *employmentDic = [basedataDic valueForKey:@"employment_type"];
        NSArray *employArr = [employmentDic valueForKey:@"item"];
        for(NSDictionary *dic in employArr){
            Employment *employment = [[Employment alloc] init];
            employment.code = [dic valueForKey:@"code"];
            employment.text = [dic valueForKey:@"text"];
            [dataInstance.employment addObject:employment];
            [employment release];
        }
        NSDictionary *workEXPDic = [basedataDic valueForKey:@"workEXP"];
        NSArray *workexpArr = [workEXPDic valueForKey:@"item"];
        for(NSDictionary *dic in workexpArr){
            WorkEXP *workexp = [[WorkEXP alloc] init];
            workexp.code = [dic valueForKey:@"code"];
            workexp.text = [dic valueForKey:@"text"];
            [dataInstance.workEXP addObject:workexp];
            [workexp release];
        }
    }
    return dataInstance;
}

-(void)dealloc
{
    self.region_city = nil;
    self.compSize = nil;
    self.compType = nil;
    self.industry = nil;
    self.job_smallJob_type = nil;
    self.mapRange = nil;
    self.publishDate = nil;
    self.education = nil;
    self.salary = nil;
    self.employment = nil;
    self.workEXP = nil;
    [super dealloc];
}
@end
