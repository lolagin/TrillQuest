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
#import "TheQuest.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TheQuest *quest = [[TheQuest alloc]init];
        [quest startTheGame];
        
        
        NSLog(@"Thanks for playing!");
        
        
    }
    return 0;
}
