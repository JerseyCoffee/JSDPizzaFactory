//
//  JSDPizzaCell.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDPizzaCell.h"

#import "JSDPizza.h"

@interface JSDPizzaCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *delegateButton;
@property(nonatomic, copy) NSArray *backgrounColorArray;
@property(nonatomic, copy) NSArray *textColorArray;

@end

@implementation JSDPizzaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _backgrounColorArray = @[@"#E5DCFA",@"#FBE4D7",@"#F9ECAC",@"#CFFFE8",@"#E0D8FF",@"#D2DDFA",@"#FDEFA3"];
    _textColorArray = @[@"#7E73AA",@"#C45F56",@"#76725A",@"#61917A",@"#857AAE",@"#5B77BB",@"#706B54"];
    
    self.numberLabel.text = @"Pizza_0001";
    self.numberLabel.font = [UIFont jsd_fontSize:10];
    self.numberLabel.layer.cornerRadius = 2;
    self.numberLabel.layer.masksToBounds = YES;
    
    [self.editButton.titleLabel setFont:[UIFont jsd_fontSize:10]];
    [self.editButton setTitle:@"[Edit]" forState:UIControlStateNormal];
    [self.editButton setTitleColor:[UIColor jsd_detailTextColor] forState:UIControlStateNormal];
    
    [self.delegateButton.titleLabel setFont:[UIFont jsd_fontSize:10]];
    [self.delegateButton setTitle:@"[Delegate]" forState:UIControlStateNormal];
    [self.delegateButton setTitleColor:[UIColor jsd_detailTextColor] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadPizzeColor:(NSInteger)chefNumber {
    
    self.numberLabel.backgroundColor = [UIColor jsd_colorWithHexString:self.backgrounColorArray[chefNumber]];
    self.numberLabel.textColor = [UIColor jsd_colorWithHexString:self.textColorArray[chefNumber]];
}

- (void)reloadViewFromPizza:(JSDPizza *)pizza {
    //拼接
    self.pizza = pizza;
    NSInteger remainCount = 4 - pizza.nameNumber.length;
    NSString* nameNumber = @"Pizza_";
    NSString* number = pizza.nameNumber;
    while (remainCount) {
        number = [@"0" stringByAppendingFormat:@"%@",number];
        remainCount--;
    }
    nameNumber = [nameNumber stringByAppendingString:number];
    
    self.numberLabel.text = nameNumber;
}

@end
