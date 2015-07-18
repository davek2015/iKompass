//
//  DataModel.m
//  SellingStuff
//
//  Created by DK Standard on 18/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(NSNumber *) getTotal: (NSArray *) curPrdArray{
    
    int total = 0;
    
    for (Product *currentProduct in curPrdArray){
        total = total + currentProduct.quantity;
    }
    
    return [NSNumber numberWithInt:total];
}

@end
