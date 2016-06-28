## 【問題２】答え合わせ

### ランキング画面の確認

* ランキング画面を確認しましょう
 * アプリで「ランキングを見る」をタップすると以下のようにランキングが表示されます

![ans2-1](/readme-img/ans2-1.png)

* 上図は３回遊んだ場合の例です。複数回遊んで、ランキングが表示されることを確認しましょう！

### コードの答え合わせ

![Xcode](/readme-img/Xcode.png)

* 模範解答は以下です

```objc
// **********【問題２】ランキングを表示しよう！**********
// GameScoreクラスを検索するクエリを作成
NCMBQuery *query = [NCMBQuery queryWithClassName:@"GameScore"];
// scoreの降順でデータを取得するように設定する
[query addDescendingOrder:@"score"];
// 検索件数を設定
query.limit = rankingNumber;
// データストアを検索
[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
if (error) {
// 検索に失敗した場合の処理
NSLog(@"検索に失敗しました。エラーコード：%ld", error.code);
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
```
