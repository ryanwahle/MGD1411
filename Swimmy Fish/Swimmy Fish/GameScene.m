//
//  GameScene.m
//  Swimmy Fish
//
//  Created by Ryan Wahle on 10/29/14.
//  Copyright (c) 2014 Ryan Wahle. All rights reserved.
//

#import "GameScene.h"
#import "CharacterMain.h"
#import "Seaweed.h"
#import "EnemyJellyFish.h"

@implementation GameScene
{
    CharacterMain *characterMain;
    SKAction *sfxSwimUp;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    self.backgroundColor = [SKColor colorWithRed:0.4f green:0.6f blue:1.0f alpha:1.0f];
    
    
    /* Setup the main character fish */
    
    characterMain = [[CharacterMain alloc] initWithCharacter];
    characterMain.xScale = 0.25;
    characterMain.yScale = 0.25;
    characterMain.position = CGPointMake(100, 100);
    [self addChild:characterMain];
    
    /* Setup the seaweed */
    Seaweed *seaweedBottom = [[Seaweed alloc] initWithSeaweed];
    seaweedBottom.xScale = 0.5;
    seaweedBottom.yScale = 0.5;
    seaweedBottom.position = CGPointMake(250, seaweedBottom.size.height / 2);
    [self addChild:seaweedBottom];
    
    Seaweed *seaweedTop = [[Seaweed alloc] initWithSeaweed];
    seaweedTop.xScale = -0.5;
    seaweedTop.yScale = -0.5;
    
    seaweedTop.position = CGPointMake(350, self.view.bounds.size.height - (seaweedTop.size.height / 2));
    [self addChild:seaweedTop];
    
    /* Setup the Enemy Jelly Fish */
    EnemyJellyFish *enemyJellyFish = [[EnemyJellyFish alloc] initWithJellyFish];
    enemyJellyFish.xScale = 0.25;
    enemyJellyFish.yScale = 0.25;
    enemyJellyFish.position = CGPointMake(500, 250);
    [self addChild:enemyJellyFish];
    
    /* Preload the SFX */
    
    sfxSwimUp = [SKAction playSoundFileNamed:@"swim.mp3" waitForCompletion:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    /* Play the swim up sound when user touches the screen */
    [self runAction:sfxSwimUp];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
