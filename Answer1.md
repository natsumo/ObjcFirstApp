## 【問題１】答え合わせ

### ニフティクラウドmobile backend上での確認
![mBaaS](/readme-img/mBaaS.png)

* 保存されたデータを確認しましょう
 * 「データストア」をクリックすると、「`GameScore`」クラスにデータが登録されていることが確認できます。

![ans1-1](/readme-img/ans1-1.png)

* 上図はスコアが35連打で名前を「あいうえお」とした場合の例です。

### コードの答え合わせ

![Xcode](/readme-img/Xcode.png)

* 模範解答は以下です

```objc
// **********【問題１】名前とスコアを保存しよう！**********
// 保存先クラスを作成
NCMBObject *obj = [NCMBObject objectWithClassName:@"GameScore"];
// 値を設定
[obj setObject:name forKey:@"name"];
[obj setObject:[NSNumber numberWithInt:score] forKey:@"score"];
// 保存を実施
[obj saveInBackgroundWithBlock:^(NSError *error) {
    if (error) {
        // 保存に失敗した場合の処理
        NSLog(@"保存に失敗しました。エラーコード:%ld", error.code);
    }else{
        // 保存に成功した場合の処理
        NSLog(@"保存に成功しました。objectId:%@",obj.objectId);
    }
}];
// **************************************************
```
