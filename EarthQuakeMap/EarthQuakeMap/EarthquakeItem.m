//
//  EarthquakeItem.m
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//

#import "EarthquakeItem.h"

@implementation Properties


@end

@implementation Geometry


@end

@implementation EarthquakeItem


+(EarthquakeItem *)EarthquakeItemFromDictionary:(NSDictionary *)dict
{
    EarthquakeItem *item = [[EarthquakeItem alloc] init];
    item.type = [dict objectForKey:@"type"];
    item.earthquakeId = [dict objectForKey:@"id"];
    
    NSDictionary *geoDict = [dict objectForKey:@"geometry"];
    item.geometry = [[Geometry alloc] init];
    item.geometry.type = [geoDict objectForKey:@"type"];
    NSArray *coord = [geoDict objectForKey:@"coordinates"];
    item.geometry.lon = [coord[0] doubleValue];
    item.geometry.lat = [coord[1] doubleValue];
    item.geometry.alt = [coord[2] doubleValue];
    
    NSDictionary *props = [dict objectForKey:@"properties"];
    item.properties = [[Properties alloc] init];
    item.properties.mag = [[props objectForKey:@"mag"] doubleValue];
    item.properties.time = [[props objectForKey:@"time"] longLongValue];
    item.properties.updated = [[props objectForKey:@"updated"] longLongValue];
    item.properties.place = [props objectForKey:@"place"];
    item.properties.title = [props objectForKey:@"title"];
    item.properties.status = [props objectForKey:@"status"];
    item.properties.type = [props objectForKey:@"type"];
    
    
    return item;
}

-(NSString *)date
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.properties.time/1000.0];
    NSDateFormatter *dtfrm = [[NSDateFormatter alloc] init];
    [dtfrm setDateFormat:@"MM/dd/yyyy"];
    return [dtfrm stringFromDate:date];
}

-(NSString *)magnitude
{
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setPositiveFormat:@"0.##"];
    return [fmt stringFromNumber:[NSNumber numberWithFloat:self.properties.mag]];
}

-(NSString *)latitude
{
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setMinimumFractionDigits:8];
    return [fmt stringFromNumber:@(self.geometry.lat)];
}

-(NSString *)longitude
{
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setMinimumFractionDigits:8];
    return [fmt stringFromNumber:@(self.geometry.lon)];
}

-(NSString *)depth
{
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setMinimumFractionDigits:3];
    return [fmt stringFromNumber:@(self.geometry.alt)];
}

@end
