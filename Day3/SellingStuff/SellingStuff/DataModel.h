//
//  DataModel.h
//  SellingStuff
//
//  Created by DK Standard on 18/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface DataModel : NSObject

@property NSMutableArray *productArray;

-(NSNumber *) getTotal: (NSArray *) curPrdArray;

@end
