//
//  FeedTableViewController.m
//  instaphoto
//
//  Created by Ryan Newton on 1/10/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "FeedTableViewController.h"
#import "PhotoViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Feed";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_feed.png"];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.title = @"Feed";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_feed.png"];
        self.imageTitleArray = @[@"Image 1",@"Image 2",@"Image 3",@"Image 4", @"Image 5"];
        self.imageFileNameArray = @[@"image1.png",@"image2.png",@"image3.png",@"image4.png",@"image5.png"];
        self.imageDetailArray = @[@"Nice starfield.",@"Some bright stars here.",@"This is pretty dark.",@"I can almost see a cloud.",@"There's that cloudy galaxy!"];
        self.imageThumbnailArray = @[@"1thumb.png",@"2thumb.png",@"3thumb.png",@"4thumb.png",@"5thumb.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [[NSURL alloc] initWithString:@"http://tryios.codeschool.com/feedImages.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        self.images = JSON;
        [self.tableView reloadData]; // this is necessary, because by the time this runs, tableView:numberOfRowsInSection has already executed
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"NSError: %@",[error localizedDescription]);
    }];
    
    [operation start];

}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.imageTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = self.images[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.images[indexPath.row][@"detail"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:self.images[indexPath.row][@"thumbnail"]] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PhotoViewController *PhotoVC = [[PhotoViewController alloc] init];
    PhotoVC.imageFileName = self.images[indexPath.row][@"filename"];
    PhotoVC.imageTitle = self.images[indexPath.row][@"title"];
    
    [self.navigationController pushViewController:PhotoVC animated:YES];
}




@end
