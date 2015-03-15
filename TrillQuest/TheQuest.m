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

    NSLog(@"You lose :(");
    [self restartGame];
}
-(void)victoryState{
    
    NSLog(@"As you enter the room you are temporary blinded\nby the striking glow emanating from a massive pile of treasure\nYou win!!!!\nKnow that while this honor is devoid of material reward,\nyou stand among giants in your accomplishment");
        [self restartGame];
    
}

-(void)restartGame{

    NSLog(@"Try again?");
    char str[100];
    fgets (str, 100, stdin);
    NSString *inputString = [[NSString alloc] initWithUTF8String:str];
    inputString = [[[inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]substringToIndex:1] lowercaseString];

    if ([inputString  isEqualTo: @"y"]){
        self.gameState = true;
        self.isRunning = true;
    }
    else if ([inputString isEqualTo:@"n"]){
        self.gameState = false;
        self.isRunning = false;
    }
    else {
        NSLog(@"Huh? That made absolutely no sense. It's a simple question--");
        [self restartGame];
    }

}



-(void)inputName{
     char str[100];
        fgets (str, 100, stdin);
        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.playerName = inputString;

}

-(void)inputWalls{
    char daBounds[100];
    fgets (daBounds, 100, stdin);
    NSString *boundsString = [[NSString alloc] initWithUTF8String:daBounds];
    NSUInteger walls = [boundsString integerValue];
    self.walls = walls;
}
-(void)startTheGame{
    self.isRunning = true;
    while (self.isRunning){
        
        
//        MENU- START/RESTART POINT
        NSLog(@"Welcome to TrillQuest.\nRemember everquest?\nthis is like that but for real men,\n with powerful facial hair\nand ninja skills.\n\nWhat's your name?");
        [self inputName];
        NSLog(@"Nice ta meetcha, %@\n now the important thing, how big of a game are you after?\nJust give me a number\n", self.playerName);
        [self inputWalls];


        
        
//EXECUTE GAME-- MAKE PLAYER,
            [self playTheGame];
        
        
    
    }
}
-(void)placeTreasureAndMonster{

    self.trillMonk = [[WarriorMonk alloc]initWarrior:self.walls];
    self.evilMonster = [[Population alloc]initWithLimits:self.walls];
    self.sackOfGold = [[Population alloc]initWithLimits:self.walls];
    if (![self checkCollisions:self.trillMonk and:self.sackOfGold]&&[self checkCollisions:self.trillMonk and:self.evilMonster]&&self.walls>3){
        [self placeTreasureAndMonster];
    }
    else {
        self.trillMonk.name = self.playerName;
        self.trillMonk.walls = self.walls;
        self.trillMonk.delegate = self;
        
    
    
}
}


-(void)checkMonsters{
    if(![self checkCollisions:self.trillMonk and:self.evilMonster]){
        NSLog(@"Uh oh!!!! Look out, %@, there's a MONSTERRRRR!!!!",self.playerName);
        [self.trillMonk getHurt];
        self.evilMonster = [[Population alloc]initWithLimits:self.walls];
        
    }
    else if (![self checkCollisions:self.trillMonk and:self.sackOfGold]){
        [self victoryState];
    }
}
-(void)playTheGame{
    NSLog(@"You are in a quiet room!");

    self.gameState = true;
    [self placeTreasureAndMonster];
    while (self.gameState) {
        
        
        NSString *exits = [NSString stringWithString:[[self checkExits]componentsJoinedByString:@", "]];
        NSLog(@"You can go %@. \nPick one!",exits);
        
        char str[100];
        fgets (str, 100, stdin);
        NSString *direction = [[NSString alloc] initWithUTF8String:str];
        direction = [direction stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [self.trillMonk move:direction];
        
        [self checkMonsters];
        
        
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

-(NSMutableArray *)checkExits{
    NSMutableArray *exits = [[NSMutableArray alloc]init];

            if (self.trillMonk.xCord > 0){
                [exits addObject:@"West"];
            }
    if (self.trillMonk.xCord < self.trillMonk.walls){
        [exits addObject:@"East"];
    }
    if (self.trillMonk.yCord < self.trillMonk.walls){
        [exits addObject:@"North"];
    }
    if (self.trillMonk.yCord > 0){
        [exits addObject:@"South"];
    }
    return exits;
}





@end
