//
//  ViewController.m
//  RCModel
//
//  Created by lorenzo stanton on 11/23/17.
//  Copyright © 2017 lorenzo stanton. All rights reserved.
//

#import "ViewController.h"

@import RCModel;


typedef NS_ENUM(NSInteger, RCLevel) {
    RCLevelBeginner,
    RCLevelIntermediate,
    RCLevelAdvanced,
    RCLevelExpert
};

@interface Test: RCModel<RCEnumMappable>

@property(nonatomic) NSString *tester;
@property(nonatomic) RCLevel level;
@property(nonatomic) NSDate *date;
@property(nonatomic) NSData *data;
@property(nonatomic) NSDictionary <NSString *, Test *> *inner;

@end

@implementation Test

+ (NSDictionary<NSString *, id<RCPropertyKey>> *)propertyMappings {
    NSMutableDictionary *dictionary = [RCModelFactory standardPropertyMappingsForClass:self].mutableCopy;
    [dictionary addEntriesFromDictionary:@{@"tester": [[[@"tester" OR:@"says"] OR:@"is"] OR:@"talk"]}];
    return dictionary;
}

+ (NSDictionary<NSString *, Class<RCModel>> *)dictionaryClasses {
    return @{@"inner": [Test class]};
}

+ (nonnull NSDictionary<NSString *, Class<RCEnumMappable>> *)enumClasses {
    return @{@"level": self};
}

+ (NSDictionary <NSString *, NSNumber *> *)enumMappings {
    return @{@"BEGINNER": @(RCLevelBeginner), @"INTERMEDIATE": @(RCLevelIntermediate) , @"Advanced": @(RCLevelAdvanced), @"EXPERT": @(RCLevelExpert)};
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *json = @"{\"tester\": 123, \"date\": \"2014-07-21T11:36:05-05:00\", \"level\": \"EXPERT\" ,\"inner\": {\"123\": {\"says\": \"It Works!\"}, \"12e3\": {\"talk\": \"It Works123!\"}}}";
    
    NSError *error;
    Test *t = [Test fromJSONString:json error:&error];
    id oo = t.inner[@"123"];
    
    t.data = [@"Test Data" dataUsingEncoding:NSUTF8StringEncoding];
    error = nil;
    NSString *json2 = [t toJSONString:&error];
    
    error = nil;
    Test *t2 = [Test fromJSONString:json2 error:&error];
    NSString *dataString = [[NSString alloc] initWithData:t2.data encoding:NSUTF8StringEncoding];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
