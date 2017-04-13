//
//  GameViewController.m
//  ObjcFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/27.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
// タップ回数
@property int count;
// 「tapFlag」的のタップ可否設定
@property BOOL tapFlag;
// タイマー（秒）
@property NSInteger countTimer;
// 「label」ラベル
@property (weak, nonatomic) IBOutlet UILabel *label;
// 「counter」テキストフィールド
@property (weak, nonatomic) IBOutlet UITextField *counter;
// 「start」ボタン
@property (weak, nonatomic) IBOutlet UIButton *start;
// 「ランキングを見る」ボタン
@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkRanking;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 文字サイズ自動調整
    self.label.adjustsFontSizeToFitWidth = YES;
    // ラベルの初期設定
    self.label.text = @"↓Startボタンを押してゲームスタート↓";
    // テキストフィールド編集不可
    self.counter.enabled = NO;
    // 的のタップを不可に設定
    self.tapFlag = NO;
    
}

// 「start」ボタン押下時の処理
- (IBAction)startGame:(UIButton *)sender {
    // 実行中ボタンの無効化
    sender.enabled = NO;
    self.checkRanking.enabled = NO;
    // カウンターを0にする
    self.count = 0;
    // タイマーを13秒にする
    self.countTimer = 13;
    // タイマーを起動
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

// 【mBaaS】データの保存
- (void)saveName:(NSString *)name saveScore:(int)score {
    // **********【問題１】名前とスコアを保存しよう！**********
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // **************************************************
}

// タイマーの処理
- (void)timerAction:(NSTimer *)sender {
    if (self.countTimer >= 11) {
        self.label.text = [NSString stringWithFormat:@"%ld", self.countTimer -10];
    } else {
        self.tapFlag = YES;
        if (self.countTimer == 10) {
            self.label.text = @"スタート！";
        } else if (self.countTimer <= 9 && self.countTimer >= 1) {
            self.label.text = [NSString stringWithFormat:@"%ld", self.countTimer];
        } else {
            self.tapFlag = NO;
            self.label.text = @"タイムアップ！";
            // タイマーストップ
            [sender invalidate];
            // 名前入力アラートの表示
            [self inputName:self.count];
        }
    }
    self.countTimer -= 1;
    
}

// 名前入力アラートの表示
- (void)inputName:(int)sender {
    // 名前を入力するアラートを表示
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"スコア登録" message:@"名前を入力してください" preferredStyle:UIAlertControllerStyleAlert];
    // UIAlertControllerにtextFieldを追加
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
    }];
    // アラートの「OK」ボタン押下時の処理
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 名前とスコアを保存
        [self saveName:alert.textFields[0].text saveScore: sender];
        // 名前とスコアの表示
        self.label.text = [NSString stringWithFormat:@"%@さんのスコアは%d連打でした", alert.textFields[0].text, sender];
        // 実行後ボタンの有効化
        self.start.enabled = YES;
        self.checkRanking.enabled = YES;
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

// viewシングルタップ時の処理
- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    if (self.tapFlag) {
        self.count += 1;
        self.counter.text = [NSString stringWithFormat:@"%d", self.count];
    }
}

@end
