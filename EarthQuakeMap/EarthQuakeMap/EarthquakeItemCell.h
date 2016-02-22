//
//  EarthquakeItemCell.h
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EarthquakeItemCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *magLabel;
@property(nonatomic, weak) IBOutlet UILabel *dateLabel;
@property(nonatomic, weak) IBOutlet UILabel *placeLabel;

@end
