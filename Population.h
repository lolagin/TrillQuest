//
//  Population.h
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/14/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Population : NSObject
@property (assign, nonatomic) NSUInteger xCord;
@property (assign, nonatomic) NSUInteger yCord;
@property (assign, nonatomic) NSUInteger walls;
@property (assign, nonatomic) NSInteger health;
-(instancetype)initWithLimits:(NSUInteger)wallIn;
-(void)move:(NSString *)direction;
-(BOOL)canMove:(NSString *)direction;
@end
