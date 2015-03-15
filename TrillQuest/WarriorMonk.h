//
//  WarriorMonk.h
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/14/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "Population.h"

@interface WarriorMonk : Population

@property (assign, nonatomic) NSInteger health;

-(instancetype)initWarrior:(NSUInteger)walls;
-(void)getHurt;




@end
