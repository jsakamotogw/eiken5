# えいけん5きゅう たんごれんしゅう

小学生（英検5級受験）向けの、単語をクイズと音声で楽しく覚えるWebアプリ（PWA）。
iPad / PC のブラウザで動作し、ホーム画面に追加すればアプリのように使えます。

## 特徴
- 英単語299語（19カテゴリ・でやすさランク付き）
- iPad/PC標準の読み上げで英単語・例文を音声再生（無料・API課金なし）
- 4択クイズ（出題中は絵文字を隠し、解答後に表示）
- かしこい出題：苦手 × 忘れたころ（間隔反復）× よく出る単語を優先
- 復習モード・シール・連続日数・効果音・ふりがな
- 学習記録は端末内（localStorage）のみに保存。外部送信なし

## ファイル構成
| ファイル | 役割 |
|---------|------|
| index.html | アプリ本体（画面・ロジック・デザイン） |
| words.js | 単語データ（ブラウザ直読み込み用。data/words.json から生成） |
| manifest.json | PWA設定（ホーム画面追加用） |
| sw.js | サービスワーカー（オフライン動作用） |
| icon.svg | アプリアイコン |
| data/ | 単語データの元（カテゴリ別JSON・統合words.json） |

## 単語データを編集したら
`data/words.json`（または各 `data/cat_*.json`）を直したあと、以下で `words.js` を再生成する：
```
python -c "import json;d=json.load(open('data/words.json',encoding='utf-8'));open('words.js','w',encoding='utf-8').write('window.EIKEN_WORDS = '+json.dumps(d['words'],ensure_ascii=False,indent=1)+';\n')"
```

## ローカルで試す
`index.html` をブラウザ（Chrome/Edge/Safari）で開くだけ。

## コンテンツについて
収録単語・例文はすべてオリジナル作成（市販教材・英検過去問の転載なし）。
本番形式の練習は、英検公式サイトが無料公開している過去問を利用してください。
