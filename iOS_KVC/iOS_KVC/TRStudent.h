//
//  TRStudent.h
//  KVC
//
//  Created by tarena132 on 15/7/1.
//  Copyright (c) 2015年 tarena132. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCourse.h"
@interface TRStudent : NSObject
{
    NSString *name;
    TRCourse *course;
    NSInteger point;
    NSArray *students;
}
@end
