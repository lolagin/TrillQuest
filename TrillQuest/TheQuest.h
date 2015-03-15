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
@property (strong, nonatomic)WarriorMonk *trillMonk;
@property (strong, nonatomic)NSString *playerName;
@property (assign, nonatomic)NSUInteger walls;


-(void)inputName;
-(void)inputWalls;
-(void)startTheGame;
-(void)playTheGame;
-(void)restartGame;
-(void)checkMonsters;
-(BOOL)checkCollisions:(WarriorMonk *)morimoto and:(Population *)treasureMonster;
-(NSMutableArray *)checkExits;


@end







