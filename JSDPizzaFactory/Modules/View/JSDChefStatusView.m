//
//  JSDChefStatusView.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDChefStatusView.h"

#import "JSDPizzaChef.h"

@interface JSDChefStatusView ()

@property (weak, nonatomic) IBOutlet UIView *headerContentView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UISwitch *workSwitch;
@property (weak, nonatomic) IBOutlet UILabel *separateLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomContentView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *workDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *workCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *workSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomSeparateLabel;


@end

@implementation JSDChefStatusView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setupView];
}

- (void)setupView {
    
    self.backgroundColor = [UIColor jsd_whiteColor];
    self.headerContentView.backgroundColor = [UIColor jsd_grayColor];
    self.bottomContentView.backgroundColor = [UIColor jsd_grayColor];
    
    self.nameLabel.font = [UIFont jsd_fontSize:14];
    self.nameLabel.textColor = [UIColor jsd_mainTextColor];
    self.nameLabel.text = @"Pizzi Chef0";
    
    self.separateLabel.backgroundColor = [UIColor jsd_weakGrayColor];
    self.bottomSeparateLabel.backgroundColor = [UIColor jsd_weakGrayColor];
    
    self.workDetailsLabel.font = [UIFont jsd_fontSize:12];
    self.workDetailsLabel.textColor = [UIColor jsd_minorTextColor];
    self.workDetailsLabel.text = @"Remaning Pizza:";
    
    self.workCountLabel.font = [UIFont jsd_fontSize:12];
    self.workCountLabel.textColor = [UIColor jsd_minorTextColor];
    self.workCountLabel.text = @"143";
    
    self.workSpeedLabel.font = [UIFont jsd_fontSize:12];
    self.workSpeedLabel.textColor = [UIColor jsd_minorTextColor];
    self.workSpeedLabel.text = @"Speed: 1 second per pizza";
}

- (IBAction)onTouchWorkSwitch:(UISwitch *)sender {
    
    
}

- (void)updateFromChef:(JSDPizzaChef *)chef index:(NSInteger)index {
    
    self.nameLabel.text = chef.name;
    self.workCountLabel.text = @(chef.pizzaSum.count).stringValue;
    self.workSpeedLabel.text = [NSString stringWithFormat:@"Speed: %d second per pizza", chef.spped];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath = [resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"chef_%ld.jpg",index]];
    self.photoImageView.image = [UIImage imageWithContentsOfFile: filePath];
    
    //暂时 Tag 表示 chef
    self.workSwitch.tag = index;
    
}

- (IBAction)onTouchStatusSwitch:(UISwitch *)sender {
    
    self.switchCallback ? self.switchCallback(sender.tag, sender.isOn) : NULL;
}



@end
