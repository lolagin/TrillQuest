//
//  Population.m
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/14/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "Population.h"

@implementation Population


-(instancetype)initWithLimits:(NSUInteger)wallIn{
    self = [super init];
    if (self){

        self.xCord =  arc4random_uniform((u_int32_t)wallIn) + 1;
        self.yCord =  arc4random_uniform((u_int32_t)wallIn) + 1;
        self.walls = wallIn;
    }
    return self;
}






-(BOOL)canMove:(NSString *)direction{

    NSString *chopd = [NSString stringWithString:[[direction substringToIndex:1] lowercaseString]];
    if ([chopd isEqual:@"w"]){
        if (self.xCord > 0){
            NSLog(@"let's go %@", direction);
            return true;
        }
        else {
            NSLog(@"That's a wall you fool!");
            return false;
            
        }
    }

else if ([chopd  isEqual:@"e"]){
    if (self.xCord < self.walls){
        NSLog(@"let's go %@", direction);
        return true;
    }
    else {
        NSLog(@"That's a wall you fool!");
            return false;
    }
}
else if ([chopd  isEqual:@"s"]){
    if (self.yCord > 0){
        NSLog(@"let's go %@", direction);
        return true;
    }
    else {
        NSLog(@"That's a wall you fool!");
            return false;
    }
}
else if ([chopd  isEqual:@"n"]){
    if (self.yCord < self.walls){
        NSLog(@"let's go %@", direction);
        return true;
    }
    else {
        NSLog(@"That's a wall you fool!");
            return false;
    }
}
else {

    NSLog(@"That's not a direction");
    return false;
}

}



-(void)move:(NSString *)direction{
    if (direction.length>0){
    NSString *chopd = [NSString stringWithString:[[direction substringToIndex:1] lowercaseString]];
    BOOL movable = [self canMove:direction];
    if ([chopd  isEqual:@"w"]){
        if (movable){
            self.xCord--;
        }
    }
    else if ([chopd  isEqual:@"e"]){
        if (movable){
            self.xCord++;
        }
    }
    else if ([chopd  isEqual:@"s"]){
        if (movable){
            self.yCord--;
        }
    }
    else if ([chopd  isEqual:@"n"]){
        if (movable){
            self.yCord++;
        }
    }

}
}
@end
