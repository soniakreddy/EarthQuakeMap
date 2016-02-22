//
//  MapViewController.m
//  EarthQuakeMap
//
//  Created by Sonia Reddy Kolli on 02/20/16.
//  Copyright (c) 2016 Sonia Reddy Kolli. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "CustomAnnotation.h"

@interface MapViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapview.delegate = self;
    [self performSelector:@selector(addEarthquakePointToMap) withObject:nil afterDelay:0.01];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addEarthquakePointToMap
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.eqItem.geometry.lat;
    coordinate.longitude = self.eqItem.geometry.lon;
    CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithName:self.eqItem.properties.type address:self.eqItem.properties.place coordinate:coordinate] ;
    [self.mapview addAnnotation:annotation];
    [self.mapview setCenterCoordinate:coordinate animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"Earthquake";
    MKAnnotationView *annotationView = (MKAnnotationView *) [self.mapview dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"PinRed.png"];
    } else {
        annotationView.annotation = annotation;
    }
    
    return annotationView;
    
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
