//
//  ViewController.h
//  MontyHall
//
//  Created by Max Kramer on 28/02/2013.
//  Copyright (c) 2013 Max Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    IBOutlet UIButton *firstDoorButton, *secondDoorButton, *thirdDoorButton;
    IBOutlet UIButton *stickButton, *allOutButton;
    
    IBOutlet UILabel *montyLabel, *resultsLabel, *instructionsLabel;
    
}

- (IBAction) choseDoor  :(id)sender;
- (IBAction) madeUpMind :(id)sender;

@end
