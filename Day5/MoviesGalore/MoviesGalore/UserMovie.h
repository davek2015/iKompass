//
//  UserMovie.h
//  MoviesGalore
//
//  Created by DK Standard on 25/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserMovie : NSManagedObject

@property (nonatomic, retain) NSNumber * movieId;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * actor;
@property (nonatomic, retain) NSString * genre;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isWatched;

@end
