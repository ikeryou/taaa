TAAA.js
========

#### 絶対に歩きスマホできないサイトになるjavascriptライブラリ ####
歩きスマホを防止できるようなUIを考えた結果がこのライブラリでした

このライブラリを使用すると、<br>
自分自身の回転とwebサイトのスクロールが連動します<br>
この時点で指でのスクロールはできなくなりますので、<br>
おのずと立ち止まり、その場でくるくるすることでしか<br>
サイトを閲覧できなくなります

これなら歩きスマホは難しいですね<br>


### デモ ###
実機デモ(スマホのみ)<br>
http://ikeryou.jp/oui/taaa/example/<br>

回り方<br>
<img src="http://ikeryou.jp/oui/taaa/t.gif" width="480" height="480">

### 使い方 ###
```javascript
// build内のtaaa.min.jsを読み後
var taaa = new TAAA();

// 引数1 : 一番下に到達する回転数 1=自身が1周でサイトの一番下までスクロール default=1
// 引数2 : スクロール時のイージング default=0.2
taaa.start(1, 0.1);
```
### bower ###
```bash
bower install taaa.js --save
```

### 対応端末 ###
* iOS7~
