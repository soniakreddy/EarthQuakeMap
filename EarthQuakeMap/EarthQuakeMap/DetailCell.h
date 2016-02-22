//
//  DetailCell.h
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *name;
@property(nonatomic, weak) IBOutlet UILabel *value;

@end
