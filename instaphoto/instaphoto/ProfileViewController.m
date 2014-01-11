//
//  ProfileViewController.m
//  instaphoto
//
//  Created by Ryan Newton on 1/9/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_profile"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://tryios.codeschool.com/userProfile.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
                                             self.userProfile = JSON;
                                             [self requestSuccessful];
                                         }
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){NSLog(@"%@", error.localizedDescription);}];
    
    [operation start];
}

- (void) requestSuccessful
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(320,480);
    
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    
    UIImage *placeholder = [UIImage imageNamed:@"placeholder.jpg"];
    NSURL *imageURL = [NSURL URLWithString:self.userProfile[@"profilePhoto"]];
    
    [profileImageView setImageWithURL:imageURL placeholderImage:placeholder];
    profileImageView.image = placeholder;
    
    [self.scrollView addSubview:profileImageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(20,140,280,40);
    nameLabel.text = [NSString stringWithFormat:@"Name: %@ %@", self.userProfile[@"firstName"], self.userProfile[@"lastName"]];
    
    [self.scrollView addSubview:nameLabel];
    
    UILabel *cityLabel = [[UILabel alloc] init];
    cityLabel.frame = CGRectMake(20,200,280,40);
    cityLabel.text = [NSString stringWithFormat:@"From: %@", self.userProfile[@"city"]];
    
    [self.scrollView addSubview:cityLabel];
    
    UITextView *biography = [[UITextView alloc] init];
    biography.frame = CGRectMake(12,260,300,180);
    biography.font = [UIFont fontWithName:@"Helvetica" size:17];
    biography.editable = NO;
    biography.text = self.userProfile[@"biography"];
    
    [self.scrollView addSubview:biography];
    
    UILabel *memberSinceLabel = [[UILabel alloc] init];
    memberSinceLabel.frame = CGRectMake(20,440,280,40);
    memberSinceLabel.text = [NSString stringWithFormat:@"Member since %@", self.userProfile[@"memberSince"]];;
    
    [self.scrollView addSubview:memberSinceLabel];
    
    [self.view addSubview:self.scrollView];
}

//creates a new subview controller to zoom in on image and push it to navigation controller
- (void) showZoomedProfile: (UIButton *) sender
{
    UIViewController *imageViewController = [[UIViewController alloc] init];
    imageViewController.view.frame = self.view.frame;
    imageViewController.title = @"Profile Image";
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snakesnladders.jpg"]];
    imageView.frame = imageViewController.view.frame;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageViewController.view addSubview:imageView];
    
    [self.navigationController pushViewController:imageViewController animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
