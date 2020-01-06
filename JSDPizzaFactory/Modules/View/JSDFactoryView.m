//
//  JSDFactoryView.m
//  JSDPiSaProcessing
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "JSDFactoryView.h"

@interface JSDFactoryView ()

@property (weak, nonatomic) IBOutlet UIView *makeDetailsView;
@property (weak, nonatomic) IBOutlet UILabel *detailsTitleLabel;
@property (weak, nonatomic) IBOutlet UIStackView *chefsStackView;
@property(nonatomic, strong) NSArray<UILabel* > *chefsLabelArray;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UILabel *buttonTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *addPizzaButton;
@property (weak, nonatomic) IBOutlet UILabel *addPizzaTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *addMorePizzaButton;
@property (weak, nonatomic) IBOutlet UILabel *addMorePizzaTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *switchTitleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *globalSwitch;

@property(nonatomic, strong) UIView *topSeparateView;

@end

@implementation JSDFactoryView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setupView];
}

- (void)setupView {
    
    self.topSeparateView = [[UIView alloc] init];
    self.topSeparateView.backgroundColor = [UIColor jsd_weakGrayColor];
    [self addSubview:_topSeparateView];
    [self.topSeparateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    UIView* backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor jsd_weakGrayColor];
//    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.stackView insertSubview:backgroundView atIndex:0];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.detailsTitleLabel.font = [UIFont jsd_fontSize:15];
    self.detailsTitleLabel.textColor = [UIColor jsd_mainTextColor];
    self.detailsTitleLabel.text = @"Bindo Pizza factory Summary";
    [self chefsLabelArray];
    
    self.buttonTitleLabel.font = [UIFont jsd_fontSize:15];
    self.buttonTitleLabel.textColor = [UIColor jsd_mainTextColor];
    self.buttonTitleLabel.text = @"Action Buttons:";
    
    [self.addPizzaButton setBackgroundColor:[UIColor jsd_colorWithHexString:@"#2AB4E3"]];
    self.addPizzaButton.tag = 0;
    [self.addPizzaButton setTitleColor:[UIColor jsd_whiteColor] forState:UIControlStateNormal];
    [self.addPizzaButton.titleLabel setFont:[UIFont jsd_fontSize:15]];
    [self.addPizzaButton setTitle:@"Add 10 Pizze" forState:UIControlStateNormal];
    
    self.addPizzaTitleLabel.font = [UIFont jsd_fontSize:14];
    self.addPizzaTitleLabel.textColor = [UIColor jsd_minorTextColor];
    self.addPizzaTitleLabel.text = @"(Add 10 more Pizza e.g)";
    
    
    [self.addMorePizzaButton setBackgroundColor:[UIColor jsd_colorWithHexString:@"#2AB4E3"]];
    [self.addMorePizzaButton setTitleColor:[UIColor jsd_whiteColor] forState:UIControlStateNormal];
    [self.addMorePizzaButton.titleLabel setFont:[UIFont jsd_fontSize:15]];
    [self.addMorePizzaButton setTitle:@"Add 100 Pizze" forState:UIControlStateNormal];
    self.addMorePizzaButton.tag = 1;
    
    self.addMorePizzaTitleLabel.font = [UIFont jsd_fontSize:14];
    self.addMorePizzaTitleLabel.textColor = [UIColor jsd_minorTextColor];
    self.addMorePizzaTitleLabel.text = @"(Add 100 more Pizza e.g)";
    
    self.switchTitleLabel.font = [UIFont jsd_fontSize:13];
    self.switchTitleLabel.textColor = [UIColor jsd_minorTextColor];
    self.switchTitleLabel.text = @"Factory Main Switch.\nWarning. This will turn off all\nchefs:";
}

- (NSArray<UILabel *> *)chefsLabelArray {
    
    if (!_chefsLabelArray) {
        
        NSMutableArray* tempArray = [NSMutableArray new];
        for (UIStackView* stackView in self.chefsStackView.subviews) {
            if ([stackView isKindOfClass:[UIStackView class]]) {
                for (UILabel* chefLabel in stackView.subviews) {
                    if ([chefLabel isKindOfClass:[UILabel class]]) {
                        chefLabel.font = [UIFont jsd_fontSize:13];
                        chefLabel.textColor = [UIColor jsd_detailTextColor];
                        chefLabel.text = [NSString stringWithFormat:@"Pizza Chef %lu: %d", (unsigned long)tempArray.count, 100];
                        [tempArray addObject:chefLabel];
                    }
                }
            }
        }
        _chefsLabelArray = [tempArray copy];
    }
    return _chefsLabelArray;
}

- (void)updatePizzaSummaryChefNumber:(NSInteger)chefNumber pizzaCount:(NSInteger)pizzaCount {
    
    UILabel* chefLabel = self.chefsLabelArray[chefNumber];
    chefLabel.text = [NSString stringWithFormat:@"Pizza Chef %lu: %lu", chefNumber, pizzaCount];    
}

- (IBAction)onTouchAddPizza:(UIButton *)sender {
    
    if (sender.tag == 0) {
        self.addPizzaCallback ? self.addPizzaCallback() : NULL;
    } else {
        self.addMorePizzaCallback ? self.addMorePizzaCallback() : NULL;
    }
}


@end
