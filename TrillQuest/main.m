//
//  main.m
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/13/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Population.h"
#import "WarriorMonk.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        NSUInteger limitz = 30;
        
        Population *monsta = [[Population alloc] initWithLimits:limitz];
        Population *trezure = [[Population alloc] initWithLimits:limitz];
        WarriorMonk *lionheart = [[WarriorMonk alloc]initWarrior:limitz];
        
        
        
        NSLog(@"coordinates: %lu,%lu",(unsigned long)monsta.xCord,(unsigned long)monsta.yCord);
        NSLog(@"coordinates: %lu,%lu",(unsigned long)trezure.xCord,(unsigned long)trezure.yCord);
        NSLog(@"coordinates: %lu,%lu",(unsigned long)lionheart.xCord,(unsigned long)lionheart.yCord);

        [lionheart move:@"south"];
        [lionheart move:@"south"];
        [lionheart move:@"south"];

        NSLog(@"coordinates: %lu,%lu",(unsigned long)monsta.xCord,(unsigned long)monsta.yCord);
        NSLog(@"coordinates: %lu,%lu",(unsigned long)trezure.xCord,(unsigned long)trezure.yCord);
        NSLog(@"coordinates: %lu,%lu",(unsigned long)lionheart.xCord,(unsigned long)lionheart.yCord);

        
        

        
        
    }
    return 0;
}
