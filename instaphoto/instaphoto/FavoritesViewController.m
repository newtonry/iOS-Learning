//
//  FavoritesViewController.m
//  instaphoto
//
//  Created by Ryan Newton on 1/9/14.
//  Copyright (c) 2014 Ryan Newton. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Favorites";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_favorites"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Adds an image view
    UIImageView *theImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tab_icon_feed"]];
    [theImageView setContentMode:UIViewContentModeTop];
    theImageView.frame = self.view.frame;
    [self.view addSubview: theImageView];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
