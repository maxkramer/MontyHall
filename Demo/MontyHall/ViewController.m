//
//  ViewController.m
//  MontyHall
//
//  Created by Max Kramer on 28/02/2013.
//  Copyright (c) 2013 Max Kramer. All rights reserved.
//

#import "ViewController.h"
#import "MontyHall.h"

@interface ViewController ()

@property (nonatomic, strong) MontyHall *presenter;

@end

@implementation ViewController
@synthesize presenter;

- (void)viewDidLoad
{
    
    self.presenter = [[MontyHall alloc] init];
    
    [super viewDidLoad];
    
    [self startGame];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) startGame {
    [self displaySecondPhase:NO];
    [self displayThirdPhase:NO];
}

- (void) displaySecondPhase:(BOOL) display {
    
    void (^DisplayBlock)() = ^{
      
        [stickButton setAlpha:display];
        [stickButton setUserInteractionEnabled:display];
        
        [allOutButton setAlpha:display];
        [allOutButton setUserInteractionEnabled:display];
        
        [montyLabel setAlpha:display];
                
        [instructionsLabel setAlpha:display];
        
    };
    
    [UIView animateWithDuration:1.0f animations:DisplayBlock];
}

- (void) displayThirdPhase:(BOOL) display {
    
    void (^DisplayBlock)() = ^{
        
        [resultsLabel setAlpha:display];
                
    };
            
    [UIView animateWithDuration:1.0f animations:DisplayBlock];
    
}

- (IBAction)choseDoor:(id)sender {
    
    if (![sender isKindOfClass:[UIButton class]])
        return;
    
    if ([montyLabel alpha] > 0) {
        [self startGame];
    }
    
    if ([sender isEqual:firstDoorButton]) {
        
        [self.presenter openDoorNumber:DoorNumberOne];
        
    }
    
    else if ([sender isEqual:secondDoorButton]) {
        
        [self.presenter openDoorNumber:DoorNumberTwo];
        
    }
    
    else if ([sender isEqual:thirdDoorButton]) {
        
        [self.presenter openDoorNumber:DoorNumberThree];
        
    }
    
    [montyLabel setText:[NSString stringWithFormat:@"Monty Hall chose the %@", [self.presenter montysChosenDoor]]];
    
    [self displaySecondPhase:YES];
    
}

- (IBAction) madeUpMind:(id)sender {
    
    if (![sender isKindOfClass:[UIButton class]])
        return;
    
    NSString *result = nil;
    
    if ([sender isEqual:stickButton]) {
        
        result = [self.presenter stickToYourDoor];
        
    }
    
    else if ([sender isEqual:allOutButton]) {
        
        result = [self.presenter openOtherDoor];
        
    }
    
    [resultsLabel setText:[NSString stringWithFormat:@"You won a %@, congratulations!", result]];
    
    [self displayThirdPhase:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
