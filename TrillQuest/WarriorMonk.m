//
//  WarriorMonk.m
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/14/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "WarriorMonk.h"
@implementation WarriorMonk
@synthesize delegate;


-(instancetype)initWarrior:(NSUInteger)walls{
   self = [[WarriorMonk alloc] initWithLimits:walls];
    self.health = 100;
    return self;
    
}


-(void)getHurt{
    self.health -= 50;
    
    if (self.health <= 0){
    if (self.delegate) {
        [self.delegate warriorDeath];
    }
    
    }
}

@end
