//
//  Movie.h
//  
//
//  Created by DK Standard on 19/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Movie : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * actor;
@property (nonatomic, retain) NSString * genre;

@end
