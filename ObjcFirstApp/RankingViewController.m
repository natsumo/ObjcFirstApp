//
//  RankingViewController.m
//  ObjcFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/27.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()<UITableViewDataSource, UITableViewDelegate>
// 「rankingTableView」ランキングを表示するテーブル
@property (weak, nonatomic) IBOutlet UITableView *rankingTableView;
// ランキング取得件数
@property const int rankingNumber;
// 取得したデータを格納する配列
@property NSArray<NCMBObject *>* rankingArray;

@end

@implementation RankingViewController

// 画面表示時に実行されるメソッド
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rankingTableView.delegate self];
    [self.rankingTableView.dataSource self];
    // ランキング取得件数を設定
    self.rankingNumber = 5;
    //保存したデータの検索と取得
    [self checkRanking];
    
}

// 【mBaaS】保存したデータの検索と取得
- (void)checkRanking {
    // **********【問題２】ランキングを表示しよう！**********
    // GameScoreクラスを検索するクエリを作成
    NCMBQuery *query = [NCMBQuery queryWithClassName:@"GameScore"];
    // scoreの降順でデータを取得するように設定する
    [query addDescendingOrder:@"score"];
    // 検索件数を設定
    query.limit = self.rankingNumber;
    // データストアを検索
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            // 検索に失敗した場合の処理
            NSLog(@"検索に失敗しました。エラーコード：%ld", (long)error.code);
        } else {
            // 検索に成功した場合の処理
            NSLog(@"検索に成功しました。");
            // 取得したデータを格納
            self.rankingArray = objects;
            // テーブルビューをリロード
            [self.rankingTableView reloadData];
        }
    }];
    // **************************************************
}

// rankingTableViewのセルの数を設定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rankingNumber;
}

// rankingTableViewのセルの内容を設定
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // キーを「cell」としてcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NCMBObject *object;
    // 「表示件数」＜「取得件数」の場合のobjectを作成
    if (indexPath.row < self.rankingArray.count) {
        object = self.rankingArray[indexPath.row];
    }
    
    // 順位の表示
    UILabel *ranking = [cell viewWithTag:1];
    ranking.text = [NSString stringWithFormat:@"%ld位", indexPath.row+1];
    
    if (object) {
        // 名前の表示
        UILabel *name = [cell viewWithTag:2];
        NSString *unwapobject_name = [object objectForKey:@"name"];
        name.text = [NSString stringWithFormat:@"%@さん", unwapobject_name];
        // スコアの表示
        UILabel *score = [cell viewWithTag:3];
        int *unwapobject_score = [object objectForKey:@"score"];
        score.text = [NSString stringWithFormat:@"%d連打", unwapobject_score];
    }
    
    
    return cell;
}

@end
