//
//  Cart3.h
//  ShoppingList
//
//  Created by DK Standard on 23/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cart3 : NSManagedObject

@property (nonatomic, retain) NSString * item;
@property (nonatomic, retain) NSNumber * done;

@end
