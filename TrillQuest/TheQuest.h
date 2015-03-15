//
//  TheQuest.h
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/13/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WarriorMonk.h"


@interface TheQuest : NSObject <WarriorDeathProtocol>

@property (assign, nonatomic)BOOL isRunning;
@property (assign, nonatomic)BOOL gameState;
@property (strong, nonatomic)Population *sackOfGold;
@property (strong, nonatomic)Population *evilMonster;
@property (strong, nonatomic)NSString *playerName;
@property (assign, nonatomic)NSUInteger walls;
-(NSString *)inputName;
-(NSUInteger)inputWalls;
-(void)startTheGame;
-(void)playTheGame:(WarriorMonk *)morimoto;

-(BOOL)checkCollisions:(WarriorMonk *)morimoto and:(Population *)treasureMonster;
-(NSMutableArray *)checkExits:(WarriorMonk *)morimoto;

@end







