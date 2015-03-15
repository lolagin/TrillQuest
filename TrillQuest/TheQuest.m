//
//  TheQuest.m
//  TrillQuest
//
//  Created by Jeffrey C Rosenthal on 3/13/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//

#import "TheQuest.h"

@implementation TheQuest 
-(void)warriorDeath{
    self.gameState = false;
    NSLog(@"You lose :(");
}
-(void)victoryState{
    self.gameState = false;
    NSLog(@"You win!!!!");
}



-(NSString *)inputName{
     char str[100];
        fgets (str, 100, stdin);
        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return inputString;
}

-(NSUInteger)inputWalls{
    char daBounds[100];
    fgets (daBounds, 100, stdin);
    NSString *boundsString = [[NSString alloc] initWithUTF8String:daBounds];
    NSUInteger walls = [boundsString integerValue];
    return walls;
}
-(void)startTheGame{
    self.isRunning = true;
    while (self.isRunning){
        
        
//        MENU- START/RESTART POINT
        NSLog(@"Welcome to TrillQuest.\nRemember everquest?\nthis is like that but for real men,\n with powerful facial hair\nand ninja skills.\n\nWhat's your name?");
        NSString *playerName = [self inputName];
        NSLog(@"Nice ta meetcha, %@\n now the important thing, how big of a game are you after?\nJust give me a number\n", playerName);
        NSUInteger walls = [self inputWalls];
        NSLog(@"%lu",walls);
        self.playerName = [NSString stringWithString:playerName];
        self.walls = walls;

        WarriorMonk *lulx = [[WarriorMonk alloc]initWarrior:25];
//EXECUTE GAME-- MAKE PLAYER,
            [self playTheGame:lulx];
        
        
        self.isRunning = false;
    }
}

-(void)playTheGame:(WarriorMonk *)morimoto{
    NSLog(@"You are in a quiet room!");

    self.gameState = true;
    while (self.gameState) {
        
        
        NSString *exits = [NSString stringWithString:[[self checkExits:morimoto]componentsJoinedByString:@", "]];
        NSLog(@"You can go %@. \nPick one!",exits);
        
        char str[100];
        fgets (str, 100, stdin);
        NSString *direction = [[NSString alloc] initWithUTF8String:str];
        direction = [direction stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [morimoto move:direction];
        
        
        
        self.gameState = false;
    }
}


-(BOOL)checkCollisions:(WarriorMonk *)morimoto and:(Population *)treasureMonster{
    if (morimoto.xCord==treasureMonster.xCord && morimoto.yCord==treasureMonster.yCord) {
        return false;
    }
    else {
        return true;
    }
}
-(NSMutableArray *)checkExits:(WarriorMonk *)morimoto{
    NSMutableArray *exits = [[NSMutableArray alloc]init];

            if (morimoto.xCord > 0){
                [exits addObject:@"West"];
            }
    if (morimoto.xCord < morimoto.walls){
        [exits addObject:@"East"];
    }
    if (morimoto.yCord < morimoto.walls){
        [exits addObject:@"North"];
    }
    if (morimoto.yCord > 0){
        [exits addObject:@"South"];
    }
    return exits;
}





@end
