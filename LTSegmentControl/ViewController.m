//
//  ViewController.m
//  LTSegmentedControl
//
//  Created by carlhuting on 15/12/17.
//  Copyright © 2015年 lemon tree. All rights reserved.
//

#import "ViewController.h"
#import "LTSegmentedControl.h"

@interface ViewController ()<LTSegmentedControlDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) LTSegmentedControl *segmentControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat height = 36;
    CGFloat y = 60;
    
    LTSegmentedControl *segmentOne = [[LTSegmentedControl alloc] initWithItems:@[@"First", @"Second"]];
    segmentOne.backgroundColor = [UIColor orangeColor];
    segmentOne.lineSpace = 1.0;
    segmentOne.minWidth = ([UIScreen mainScreen].bounds.size.width) / 2;
    segmentOne.frame = CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width,height);
    segmentOne.segmentDelegate = self;
    segmentOne.layer.borderColor = [UIColor darkGrayColor].CGColor;
    segmentOne.layer.borderWidth = 1.0;

    [self.view addSubview:segmentOne];
    
    LTSegmentedControl *segmentTwo = [[LTSegmentedControl alloc] initWithItems:@[@"A", @"B", @"C"]];
    segmentTwo.indicatorView = [segmentTwo topLineIndicatorView];
    segmentTwo.lineSpace = 1.0;
    segmentTwo.minWidth = ([UIScreen mainScreen].bounds.size.width - 2) / 3;
    segmentTwo.frame = CGRectMake(0, y += 60 , [UIScreen mainScreen].bounds.size.width,height);
    segmentTwo.segmentDelegate = self;
    [self.view addSubview:segmentTwo];
    
    LTSegmentedControl *segmentThree = [[LTSegmentedControl alloc] initWithItems:@[@"A", @"B", @"C"]];
    segmentThree.backgroundColor = [UIColor clearColor];
    segmentThree.lineSpace = 1.0;
    segmentThree.frame = CGRectMake(0, y += 60, [UIScreen mainScreen].bounds.size.width,height);
    segmentThree.segmentDelegate = self;
    [self.view addSubview:segmentThree];
    
    self.segmentControl = [[LTSegmentedControl alloc] initWithItems:@[@"A", @"B", @"C", @"D", @"welcome", @"F", @"G", @"H", @"I", @"J", @"K", @"L"]];
    self.segmentControl.lineSpace = 0;
    self.segmentControl.minWidth = 40;
    self.segmentControl.maxWidth = 60;
    self.segmentControl.frame = CGRectMake(0, y += 60, [UIScreen mainScreen].bounds.size.width,height);
    [self.view addSubview:self.segmentControl];
    self.segmentControl.segmentDelegate = self;

}

- (IBAction)tapped:(id)sender {
    NSUInteger index = random();
    index = index % (self.segmentControl.numberOfSegments + 1);
    self.segmentControl.selectedSegmentIndex = index;
}

-(void)selectedIndexChanged:(NSUInteger)index {
    self.label.text = @(index).stringValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
