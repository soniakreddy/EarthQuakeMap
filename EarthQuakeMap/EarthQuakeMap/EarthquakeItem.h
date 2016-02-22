//
//  EarthquakeItem.h
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Geometry : NSObject

@property(nonatomic,strong) NSString *type;
@property(nonatomic,assign) double lat;
@property(nonatomic,assign) double lon;
@property(nonatomic,assign) double alt;

@end

@interface Properties : NSObject

@property(nonatomic,assign) double mag;
@property(nonatomic,strong) NSString *place;
@property(nonatomic, assign) long time;
@property(nonatomic, assign) long updated;
@property(nonatomic, assign) int tz;
@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *detail;
@property(nonatomic, strong) id felt;
@property(nonatomic, strong) id cdi;
@property(nonatomic, strong) id mmi;
@property(nonatomic, strong) id alert;
@property(nonatomic, strong) NSString *status;
@property(nonatomic, assign) int tsunami;
@property(nonatomic, assign) int sig;
@property(nonatomic, strong) NSString *net;
@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSString *ids;
@property(nonatomic, strong) NSString *sources;
@property(nonatomic, strong) NSString *types;
@property(nonatomic, assign) int nst;
@property(nonatomic, assign) double dmin;
@property(nonatomic, assign) double rms;
@property(nonatomic, assign) double gap;
@property(nonatomic, strong) NSString *magType;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSString *title;


@end

@interface EarthquakeItem : NSObject

@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *earthquakeId;
@property(nonatomic, strong) Geometry *geometry;
@property(nonatomic, strong) Properties *properties;

+(EarthquakeItem *)EarthquakeItemFromDictionary:(NSDictionary *)dict;
-(NSString *)date;
-(NSString *)magnitude;
-(NSString *)latitude;
-(NSString *)longitude;
-(NSString *)depth;

@end
