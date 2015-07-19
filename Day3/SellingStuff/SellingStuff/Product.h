//
//  Product.h
//  SellingStuff
//
//  Created by DK Standard on 18/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (readonly) NSString *name;
@property int quantity;

-(instancetype)initWithName:(NSString *)name;

@end
