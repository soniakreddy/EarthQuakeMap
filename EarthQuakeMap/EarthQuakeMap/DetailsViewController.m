//
//  DetailsViewController.m
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailCell.h"
#import "MapViewController.h"

@interface DetailsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *detailsListView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"map_normal.png"] style:UIBarButtonItemStyleDone target:self action:@selector(mapPressed)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapPressed
{
    MapViewController *map = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    map.eqItem = self.eqItem;
    [self.navigationController pushViewController:map animated:YES];
}

#pragma mark 
#pragma mark UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailCell";
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.name.text = @"Type";
        cell.value.text = self.eqItem.properties.type;
    }else if (indexPath.row == 1) {
        cell.name.text = @"Magnitude";
        cell.value.text = [self.eqItem magnitude];
    }else if (indexPath.row == 2) {
        cell.name.text = @"Date";
        cell.value.text = [self.eqItem date];
    }else if (indexPath.row == 3) {
        cell.name.text = @"Status";
        cell.value.text = self.eqItem.properties.status;
    }else if (indexPath.row == 4) {
        cell.name.text = @"Longitude";
        cell.value.text = [self.eqItem longitude];
    }else if (indexPath.row == 5) {
        cell.name.text = @"Latitude";
        cell.value.text = [self.eqItem latitude];
    }else if (indexPath.row == 6) {
        cell.name.text = @"Depth";
        cell.value.text = [self.eqItem depth];
    }else if (indexPath.row == 7) {
        cell.name.text = @"Place";
        cell.value.text = self.eqItem.properties.place;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}



@end
