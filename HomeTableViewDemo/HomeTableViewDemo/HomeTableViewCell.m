//
//  HomeTableViewCell.m
//  HomeTableViewDemo
//
//  Created by 李龙 on 16/3/28.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "config.h"
#import "LeftTableView.h"
#import "RightCollectionView.h"


@interface HomeTableViewCell ()<UIScrollViewDelegate>
@property (nonatomic,strong) UILabel *myLbale;

@property (nonatomic,strong) UIView *myADView;
@property (nonatomic,strong) LeftTableView *leftView;
@property (nonatomic,strong) RightCollectionView *rightView;
@property (nonatomic,strong) UIButton *leftMenuBtn;
@property (nonatomic,strong) UIButton *rightMenuBtn;
@property (nonatomic,strong) UIScrollView *myScrollView;

@end


@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        NSLog(@"%s",__FUNCTION__);
        
        _myADView = ({
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [self addSubview:view];
            view;
        });
        
        
        _leftMenuBtn = ({
            UIButton *btn = [UIButton new];
            [btn setTitle:@"音乐" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor greenColor];
            [self addSubview:btn];
            btn;
        });
    
        _rightMenuBtn = ({
            UIButton *btn = [UIButton new];
            [btn setTitle:@"电影" forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor blueColor];
            [self addSubview:btn];
            btn;
        });
        
        
        _myScrollView = ({
        
            UIScrollView *scrollView = [UIScrollView new];
            scrollView.backgroundColor = [UIColor cyanColor];
            scrollView.pagingEnabled = YES;
            scrollView.delegate = self;
            scrollView.bounces = NO;
            [self addScrollViewSubViews:scrollView];//添加子控件
            
            [self addSubview:scrollView];
            scrollView;
        
        });
        
        
    }
    
    return self;
}


- (void)addScrollViewSubViews:(UIScrollView *)scrollView{
    
    _leftView = ({
        LeftTableView *leftView = [LeftTableView new];
        leftView.backgroundColor = [UIColor lightGrayColor];
//        leftView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, 300);
        
        CGFloat leftTableViewHeight = leftView.tableView.contentSize.height;
        NSLog(@"leftTableViewHeight: %f",leftTableViewHeight);
        NSLog(@"leftView.tableView: %f",leftView.tableView.height);
        
        [scrollView addSubview:leftView];
        leftView;
    });
    
    
    
    _rightView = ({
        RightCollectionView *rightView = [RightCollectionView new];
        rightView.backgroundColor = [UIColor yellowColor];
        rightView.frame = CGRectMake(LLkeyWindowsSize.width, 0, LLkeyWindowsSize.width, 500);
        
        [scrollView addSubview:rightView];
        rightView;
    });
    
}




-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"");
    
    _myADView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, 100);
    _leftMenuBtn.frame = CGRectMake(0, _myADView.buttom, LLkeyWindowsSize.width*0.5, 40);
    _rightMenuBtn.frame = CGRectMake(_leftMenuBtn.right, _myADView.buttom, LLkeyWindowsSize.width*0.5, 40);
    
    //设置scrolView部分
    NSLog(@"%f",_leftMenuBtn.buttom);
    _myScrollView.frame = CGRectMake(0, _leftMenuBtn.buttom, LLkeyWindowsSize.width, LLkeyWindowsSize.height-_leftMenuBtn.buttom+72);
//    _myScrollView.frame = CGRectMake(0, _leftMenuBtn.buttom, LLkeyWindowsSize.width, LLkeyWindowsSize.height-_leftMenuBtn.buttom);
    _myScrollView.contentSize = CGSizeMake(LLkeyWindowsSize.width*2, 500);
    
    _leftView.frame = CGRectMake(0, 0, LLkeyWindowsSize.width, _leftView.tableViewHeight);
     
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollView.point: %@",NSStringFromCGPoint(scrollView.contentOffset));
//    if (scrollView.contentOffset.x / LLkeyWindowsSize.width == 0) {
//        <#statements#>
//    }
    
    
    //取得scrollView滚动的位置
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat imgWidth = self.myScrollView.frame.size.width;
    //超过视图一半的宽度判断为下一页
    NSInteger index = (offsetX + imgWidth * 0.5) / imgWidth;//宽为375
    
    NSLog(@"scroll to page Index : %zd",index);
    
//    [self.options scrollOptionToIndex:index];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end