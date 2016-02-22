//
//  ViewController.m
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//
#import "ListViewController.h"
#import "EarthquakeItem.h"
#import "EarthquakeItemCell.h"
#import "DetailsViewController.h"
#import "HUD/HUD.h"

@interface ListViewController () <UITableViewDataSource,UITableViewDelegate>
{
    
    NSArray *earthQuakes;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0.01];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{
    [HUD showUIBlockingIndicatorWithText:@"Fetching earthquake information ..."];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"http://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2014-01-01&endtime=2014-01-02"] completionHandler:^(NSData *data, NSURLResponse *response, NSError * error) {
        
        NSError *e = nil;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        if (!jsonDict) {
            NSLog(@"Error parsing JSON: %@", e);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^(void){
                [HUD hideUIBlockingIndicator];
                [self.earthquakeList reloadData];
            }];
        } else {
            NSMutableArray *earthquakes = [[NSMutableArray alloc] init];
            NSArray *values = [jsonDict objectForKey:@"features"];
            for (NSDictionary *dict in values) {
                EarthquakeItem *item = [EarthquakeItem EarthquakeItemFromDictionary:dict];
                [earthquakes addObject:item];
            }
            
            earthQuakes = earthquakes;
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^(void){
                [HUD hideUIBlockingIndicator];
                [self.earthquakeList reloadData];
            }];
            
        }
        
    }] resume];
}

#pragma mark -
#pragma mark TableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return earthQuakes.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //push your view controlle to move to next view controller
    NSLog(@"push view controller");
    DetailsViewController *details = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    details.eqItem = earthQuakes[indexPath.row];
    [self.navigationController pushViewController:details animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"EarthquakeItemCell";
    EarthquakeItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    EarthquakeItem *eqItem  = [earthQuakes objectAtIndex:indexPath.row];
    cell.magLabel.text = [eqItem magnitude];
    cell.dateLabel.text = [eqItem date];
    cell.placeLabel.text = eqItem.properties.place;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

#pragma mark -

@end
