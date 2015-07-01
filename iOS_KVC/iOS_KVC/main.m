//
//  main.m
//  iOS_KVC
//
//  Created by tarena132 on 15/7/1.
//  Copyright (c) 2015年 tarena132. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
//Key­Value­Coding(KVC)键值编码来访问你要存取的类的属性
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRStudent *student = [[TRStudent alloc]init];
        //存
        [student setValue:@"张三" forKey:@"name"];
        //取
        NSLog(@"%@",[student valueForKey:@"name"]);
        
        TRCourse *course = [[TRCourse alloc]init];
        //存
        [course setValue:@"语文课" forKey:@"courseName"];
        [student setValue:course forKey:@"course"];
        //取
        NSString *courseName = [student valueForKeyPath:@"course.courseName"];
        NSLog(@"%@", courseName);
        //也可以存值
        [student setValue:@"数学课" forKeyPath:@"course.courseName"];
        //取
        courseName = [student valueForKeyPath:@"course.courseName"];
        NSLog(@"%@", courseName);
        
        //自动封装基本数据类型(point属性为NSInteger)。使用下面方法可以将其封装
        [student setValue:@"88" forKey:@"point"];
        NSString *point = [student valueForKey:@"point"];
        NSLog(@"%@", point);
        //在Student类中加入数组NSArray,用来表示其他的学生。这样我们可以添加多个其他的学生,再用集合操作计算学生的 分数,最高分,最低分,平均分等
        TRStudent *student1 = [[TRStudent alloc]init];
        TRStudent *student2 = [[TRStudent alloc]init];
        TRStudent *student3 = [[TRStudent alloc]init];
        [student1 setValue:@"65" forKey:@"point"];
        [student2 setValue:@"77" forKey:@"point"];
        [student3 setValue:@"99" forKey:@"point"];
        
        NSArray *array = @[student1, student2, student3];
        [student setValue:array forKey:@"students"];
        NSLog(@"学生成绩%@",[student valueForKeyPath:@"students.point"]);
        NSLog(@"学生数:%@",[student valueForKeyPath:@"students.@count"]);
        NSLog(@"最高成绩:%@", [student valueForKeyPath:@"students.@max.point"]);
        NSLog(@"最低成绩:%@", [student valueForKeyPath:@"students.@min.point"]);
        NSLog(@"平均成绩:%@", [student valueForKeyPath:@"students.@avg.point"]);
    }
    return 0;
}
