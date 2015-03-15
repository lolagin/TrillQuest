//
//  WarriorMonk.h
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/14/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "Population.h"
@protocol WarriorDeathProtocol
    @required
    @optional
    -(void)warriorDeath;
@end
@interface WarriorMonk : Population

@property (nonatomic, weak) id<WarriorDeathProtocol> delegate;

@property (assign, nonatomic) NSInteger health;
@property (strong, nonatomic) NSString *name;

-(instancetype)initWarrior:(NSUInteger)walls;
-(void)getHurt;

@end




