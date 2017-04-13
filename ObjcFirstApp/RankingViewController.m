//
//  RankingViewController.m
//  ObjcFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/27.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()<UITableViewDataSource, UITableViewDelegate>
// 「rankingTableView」ランキングを表示するテーブル
@property (weak, nonatomic) IBOutlet UITableView *rankingTableView;
// 取得したデータを格納する配列
@property NSArray *rankingArray;

@end

// ランキング取得件数
const int rankingNumber = 5;

@implementation RankingViewController

// 画面表示時に実行されるメソッド
- (void)viewDidLoad {
    [super viewDidLoad];
    self.rankingTableView.delegate = self;
    self.rankingTableView.dataSource = self;
    //保存したデータの検索と取得
    [self checkRanking];
    
}

// 【mBaaS】保存したデータの検索と取得
- (void)checkRanking {
    // **********【問題２】ランキングを表示しよう！**********
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // **************************************************
}

// rankingTableViewのセルの数を設定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rankingNumber;
}

// rankingTableViewのセルの内容を設定
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // キーを「cell」としてcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rankingTableCell" forIndexPath:indexPath];
    
    NCMBObject *object;
    // 「表示件数」＜「取得件数」の場合のobjectを作成
    if (indexPath.row < self.rankingArray.count) {
        object = self.rankingArray[indexPath.row];
    }
    
    // 順位の表示
    UILabel *ranking = (UILabel *)[cell viewWithTag:1];
    ranking.text = [NSString stringWithFormat:@"%ld位", indexPath.row+1];
    
    if (object) {
        // 名前の表示
        UILabel *name = (UILabel *)[cell viewWithTag:2];
        name.text = [NSString stringWithFormat:@"%@さん", [object objectForKey:@"name"]];
        // スコアの表示
        UILabel *score = (UILabel *)[cell viewWithTag:3];
        score.text = [NSString stringWithFormat:@"%@連打", [object objectForKey:@"score"]];
    }
    
    return cell;
}

@end
