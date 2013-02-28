//
//  MontyHall.h
//  
//
//  Created by Max Kramer on 28/02/2013.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    
    DoorNumberOne   = 0,
    DoorNumberTwo   = 1,
    DoorNumberThree = 2,
    
} DoorNumber;

@interface MontyHall : NSObject

- (void) openDoorNumber:(DoorNumber) number;

- (NSString *) stickToYourDoor;
- (NSString *) openOtherDoor;

@property (nonatomic, readonly) NSString *montysChosenDoor;

@end
