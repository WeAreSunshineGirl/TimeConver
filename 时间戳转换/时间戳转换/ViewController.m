//
//  ViewController.m
//  时间戳转换
//
//  Created by user on 17/3/30.
//  Copyright © 2017年 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     *  在文本中间添加横划线
     *  @param text
     *  @return NSMutableAttributedString
     */
    
    
    NSLog(@"%@",[NSBundle mainBundle]);
    NSString *rootAppPath = @"/Applications";
    NSArray *listApp = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:rootAppPath error:nil];
    NSLog(@"-----%@",listApp);

//    时间戳转时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = @"1490836840000";//毫秒
    NSInteger times = [str doubleValue]/1000;//秒
    NSString * timeStr = [NSString stringWithFormat:@"%ld",(long)times];
    
    NSTimeInterval timerInter = [timeStr doubleValue]+28800;
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timerInter];
    NSLog(@"1490836840000  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    
//    时间转化时间戳
    
    NSString* timeSt = @"2017-3-30 17:20:40";
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
    [formatter1 setTimeStyle:NSDateFormatterShortStyle];
    [formatter1 setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter1 setTimeZone:timeZone];
    
    NSDate* date = [formatter1 dateFromString:timeSt];
    //     NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSTimeInterval timeee = ([timeSp doubleValue]-28800)*1000;
    NSString *ss = [NSString stringWithFormat:@"%f",timeee];
    NSLog(@"timeSp:%@",ss); //时间戳的值

    _label.attributedText = [self addTextCenterLine:@"守财奴度假村内纪念册"];
}

- (NSMutableAttributedString *) addTextCenterLine:(NSString *) text{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    [attrString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, text.length)];
    [attrString addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, text.length)];
    return attrString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
