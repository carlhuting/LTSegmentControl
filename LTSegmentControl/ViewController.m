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
    LTSegmentedControl *segmentZero = [[LTSegmentedControl alloc] initWithItems:@[@"A", @"B"]];
    segmentZero.backgroundColor = [UIColor orangeColor];
    segmentZero.lineSpace = 1.0;
    segmentZero.minWidth = ([UIScreen mainScreen].bounds.size.width) / 2;
    segmentZero.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width,30);
    segmentZero.segmentDelegate = self;
    [self.view addSubview:segmentZero];
    
    LTSegmentedControl *segmentTwo = [[LTSegmentedControl alloc] initWithItems:@[@"A", @"B", @"C"]];
    segmentTwo.lineSpace = 1.0;
    segmentTwo.minWidth = ([UIScreen mainScreen].bounds.size.width - 2) / 3;
    segmentTwo.frame = CGRectMake(0, 130, [UIScreen mainScreen].bounds.size.width,30);
    segmentTwo.segmentDelegate = self;
    [self.view addSubview:segmentTwo];
    
    
    self.segmentControl = [[LTSegmentedControl alloc] initWithItems:@[@"A", @"B", @"C", @"D", @"welcome", @"F", @"G", @"H", @"I", @"J", @"K", @"L"]];
    self.segmentControl.lineSpace = 0;
    self.segmentControl.minWidth = 40;
    self.segmentControl.maxWidth = 60;
    self.segmentControl.frame = CGRectMake(0, 190, [UIScreen mainScreen].bounds.size.width,30);
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
