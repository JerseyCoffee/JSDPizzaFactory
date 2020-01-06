//
//  ViewController.m
//  JSDPizzaFactory
//
//  Created by Jersey on 6/1/2020.
//  Copyright © 2020 Jersey. All rights reserved.
//

#import "ViewController.h"

#import "JSDChefStatusView.h"
#import "JSDFactoryView.h"
#import "JSDPizzaCell.h"
#import "JSDPizzaChefManager.h"
#import "JSDPizzaFactory.h"
#import "JSDPizzaChef.h"

NSInteger const kChefCount = 7;
static NSString* const kPizzaCellIdentifier = @"PizzaCellIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) UIView *contentSubView;
@property(nonatomic, strong) UIStackView *chefManagerStackView;
@property(nonatomic, strong) NSArray<JSDChefStatusView *> *chefStatusViews;
@property(nonatomic, strong) UIStackView *pizzaStackView;
@property(nonatomic, strong) NSArray<UITableView *>* pizzaListArray;
@property(nonatomic, strong) JSDFactoryView *factoryManagerView;
@property(nonatomic, strong) JSDPizzaFactory *pizzaFactory;
@property(nonatomic, strong) JSDPizzaChefManager *pizzaChefManager;

@end

@implementation ViewController

#pragma mark - View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置导航栏
    [self setupNavBar];
    //2.设置view
    [self setupView];
    //3.请求数据
    [self setupData];
    //5.解析数据
    [self setupAnalyticalData];
    //6.设置通知
    [self setupNotification];
    //7.private
    [self setupPrivateMethod];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    // 交互绑定
    @weakify(self)
    self.factoryManagerView.addPizzaCallback = ^{
        @strongify(self)
        [self.pizzaFactory addMakePizzaCount:10 completionBlock:^{
            @strongify(self)
            [self reloadingView];
        }];
        
    };
    self.factoryManagerView.addMorePizzaCallback = ^{
        @strongify(self)
        [self.pizzaFactory addMakePizzaCount:100 completionBlock:^{
            @strongify(self)
            [self reloadingView];
        }];
    };
    
    [self.chefStatusViews enumerateObjectsUsingBlock:^(JSDChefStatusView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.switchCallback = ^(NSInteger chefIndex, BOOL status) {
            [self.pizzaFactory willSwitchChefStatus:chefIndex switchStatus:status];
        };
    }];
}

#pragma mark - 2 SettingView and Style

-(void)setupNavBar {
    
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_colorWithHexString:@"#731A62"];
    
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.bottom.mas_equalTo(-30);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    [self.contentView addSubview:self.contentSubView];
    [self.contentSubView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    [self.contentSubView addSubview:self.chefManagerStackView];
    [self.chefManagerStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(265);
    }];
    
    NSMutableArray* tempChefViews = [NSMutableArray new];
    for (NSInteger i = 0; i < 7; i++) {
        JSDChefStatusView* chefView = [[NSBundle mainBundle] loadNibNamed:@"JSDChefStatusView" owner:nil options:nil].lastObject;
        [tempChefViews addObject:chefView];
        [self.chefManagerStackView addArrangedSubview:chefView];
    }
    self.chefStatusViews = [tempChefViews copy];
        
    [self.contentSubView addSubview:self.factoryManagerView];
    
    [self.factoryManagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(125);
    }];
    
    [self.contentSubView addSubview:self.pizzaStackView];
    [self.pizzaStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.chefManagerStackView.mas_bottom);
        make.bottom.mas_equalTo(self.factoryManagerView.mas_top);
    }];
    [self.pishaListArray enumerateObjectsUsingBlock:^(UITableView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.delegate = self;
        obj.dataSource = self;
        [obj registerNib:[UINib nibWithNibName:@"JSDPizzaCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kPizzaCellIdentifier];
        obj.tag = idx;
        obj.separatorStyle = UITableViewCellSeparatorStyleNone;
        obj.showsVerticalScrollIndicator = NO;
        obj.rowHeight = 30;
        [self.pizzaStackView addArrangedSubview:obj];
    }];
}

- (void)reloadingView {
    
    @weakify(self)
    [self.pizzaChefManager.chefs enumerateObjectsUsingBlock:^(JSDPizzaChef * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //更新剩下披萨
        @strongify(self)
        [self.chefStatusViews[idx] updateFromChef:obj index:idx];
        //这里应该是更新已做完的
        [self.factoryManagerView updatePizzaSummaryChefNumber:idx pizzaCount:obj.pizzaSum.count];
    }];
    
    [self reloadingPizzaListView];
}

- (void)reloadingPizzaListView {
    
    [self.pizzaListArray enumerateObjectsUsingBlock:^(UITableView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj reloadData];
    }];
}

#pragma mark - 3 Request Data

- (void)setupData {
    
    @weakify(self)
    [self.pizzaFactory addMakePizzaCount:1000 completionBlock:^{
        @strongify(self)
        [self reloadingView];
    }];
}



#pragma mark - 4 UITableViewDataSource and UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.pizzaChefManager.chefs[tableView.tag].pizzaSum.count;
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSDPizzaCell* cell = [tableView dequeueReusableCellWithIdentifier:kPizzaCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JSDPizzaCell" owner:nil options:nil].lastObject;
    }
    [cell reloadPizzeColor:tableView.tag];
    JSDPizza* pizza = self.pizzaChefManager.chefs[tableView.tag].pizzaSum[indexPath.row];
    [cell reloadViewFromPizza:pizza];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 5 Event Response


- (void)setupAnalyticalData {
    
    
}
#pragma mark - 6 Private Methods

- (void)setupNotification {
    
}

- (void)setupPrivateMethod {
    
    
}

#pragma mark - 7 GET & SET

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor jsd_whiteColor];
    }
    return _contentView;
}

- (UIView *)contentSubView {
    
    if (!_contentSubView) {
        _contentSubView = [[UIView alloc] init];
        _contentSubView.backgroundColor = [UIColor jsd_whiteColor];
        _contentSubView.layer.borderColor = [UIColor jsd_weakGrayColor].CGColor;
        _contentSubView.layer.borderWidth = 1;
    }
    return _contentSubView;
}

- (UIStackView *)chefManagerStackView {
    
    if (!_chefManagerStackView) {
        _chefManagerStackView = [[UIStackView alloc] init];
        _chefManagerStackView.axis = UILayoutConstraintAxisHorizontal;
        _chefManagerStackView.spacing = 1;
        _chefManagerStackView.distribution = UIStackViewDistributionFillEqually;
        UIView* backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor jsd_weakGrayColor];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_chefManagerStackView addSubview:backgroundView];
    }
    return _chefManagerStackView;
}

- (UIStackView *)pizzaStackView {
    
    if (!_pizzaStackView) {
        _pizzaStackView = [[UIStackView alloc] init];
        _pizzaStackView.axis = UILayoutConstraintAxisHorizontal;
        _pizzaStackView.spacing = 1;
        _pizzaStackView.distribution = UIStackViewDistributionFillEqually;
        UIView* backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = [UIColor jsd_weakGrayColor];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_pizzaStackView addSubview:backgroundView];
    }
    return _pizzaStackView;
}

- (JSDFactoryView *)factoryManagerView {
    
    if (!_factoryManagerView) {
        _factoryManagerView = [[NSBundle mainBundle] loadNibNamed:@"JSDFactoryView" owner:nil options:nil].lastObject;
    }
    return _factoryManagerView;
}

- (NSArray<UITableView *> *)pishaListArray {
    
    if (!_pizzaListArray) {
        NSMutableArray* tempArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < kChefCount; i++) {
            UITableView* tableView = [[UITableView alloc] init];
            [tempArray addObject:tableView];
        }
        _pizzaListArray = tempArray.copy;
    }
    return _pizzaListArray;
}

- (JSDPizzaFactory *)pizzaFactory {
    
    if (!_pizzaFactory) {
        _pizzaFactory = [[JSDPizzaFactory alloc] init];
        _pizzaFactory.delegate = self.pizzaChefManager;
    }
    return _pizzaFactory;
}

- (JSDPizzaChefManager *)pizzaChefManager {
    
    if (!_pizzaChefManager) {
        _pizzaChefManager = [[JSDPizzaChefManager alloc] initWithChefCount:kChefCount];
    }
    return _pizzaChefManager;
}

@end

