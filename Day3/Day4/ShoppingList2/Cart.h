//
//  Cart.h
//  
//
//  Created by DK Standard on 23/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Cart : NSManagedObject

@property (nonatomic, retain) NSString * item;
@property (nonatomic, retain) NSNumber * done;

@end
