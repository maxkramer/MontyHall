//
//  MontyHall.m
//  
//
//  Created by Max Kramer on 28/02/2013.
//
//

#import "MontyHall.h"

@interface MontyHall ()

@property (nonatomic, assign) DoorNumber doorOne, doorTwo, doorThree, primaryDoor, montyDoor;

@property (nonatomic, strong) NSArray *possiblePrizes;
@property (nonatomic, strong) NSMutableArray *randomisedPrizes;

@end

@implementation MontyHall

@synthesize doorOne, doorTwo, doorThree, primaryDoor, montyDoor;
@synthesize possiblePrizes, randomisedPrizes;

/*
 
 Suppose you're on a game show, and you're given the choice of three doors: Behind one door is a car; behind the others, goats. 
 You pick a door, say No. 1, and the host, who knows what's behind the doors, opens another door, say No. 3, which has a goat. 
 He then says to you, "Do you want to pick door No. 2?" 
 Is it to your advantage to switch your choice?

 */

- (id) init {
    if ((self = [super init])) {
        self.possiblePrizes = @[@"Car", @"Goat", @"Goat"];
    }
    return self;
}

- (void) openDoorNumber:(DoorNumber) number {
    
    if (self.randomisedPrizes != nil) {
        
        [self.randomisedPrizes removeAllObjects];
        [self.randomisedPrizes addObjectsFromArray:self.possiblePrizes];
        
    }
    
    else {
        
        self.randomisedPrizes = [NSMutableArray arrayWithArray:self.possiblePrizes];
        
    }
    
    for (int i = 0; i < [self.randomisedPrizes count]; i++) {
        
        [self.randomisedPrizes exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform([self.randomisedPrizes count])];
        
    }

    self.primaryDoor = number;
    
    NSMutableIndexSet *possibleIndexes = [NSMutableIndexSet indexSet];
    
    [self.randomisedPrizes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       
        if (idx != self.primaryDoor) {
            
            [possibleIndexes addIndex:idx];
            
        }
        
    }];
    
    self.montyDoor = arc4random() % 2 == 0 ? [possibleIndexes firstIndex] : [possibleIndexes lastIndex];
    
}

- (NSString *) stickToYourDoor {
    
    return [self.randomisedPrizes objectAtIndex:self.primaryDoor];
    
}

- (NSString *) openOtherDoor {
    
    __block NSString *result;
    
    [self.randomisedPrizes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if (idx != self.montyDoor && idx != self.primaryDoor) {
            
            result = obj;
            *stop = YES;
            
        }
        
    }];
    
    return result;
    
}

- (NSString *) montysChosenDoor {
    return (self.montyDoor == DoorNumberOne) ? @"First Door" : (self.montyDoor == DoorNumberTwo) ? @"Second Door" : @"Third Door";
}

@end
