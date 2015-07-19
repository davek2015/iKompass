//
//  Product.m
//  SellingStuff
//
//  Created by DK Standard on 18/7/15.
//  Copyright (c) 2015 iKompass. All rights reserved.
//

#import "Product.h"

@interface Product ()

@property (readwrite) NSString *name;

@end

@implementation Product

-(instancetype) initWithName:(NSString *)name{
    
    self = [super init];
    self.name = name;
    
    return self;
}

-(instancetype) init{
    
    NSException *exception = [NSException exceptionWithName:@"Invalid method called" reason:@"Use the initWithName method" userInfo:nil];
    [exception raise];
    
    return self;
}

@end
