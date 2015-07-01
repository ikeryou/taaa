TAAA.js
========

#### 絶対に歩きスマホできないサイトになるJavascriptライブラリ ####
歩きスマホを防止できるようなUIを考えた結果がこのライブラリでした

このライブラリを使うと指でのスクロールは一切できなくなり<br>
自分自身がその場で回転することでしか<br>
webサイトをスクロールできないようになります

これなら歩きスマホは難しいですね<br>


### デモ ###
* 実機デモ(スマホのみ)<br>
http://ikeryou.jp/oui/taaa/example/<br>

* 回り方<br>
https://vine.co/v/e17zUJWwnvA

### 使い方 ###
```javascript
// build内のtaaa.min.jsを読み後
var taaa = new TAAA();

// 引数1 : 一番下に到達する回転数 1=自身が1周でサイトの一番下までスクロール default=1
// 引数2 : スクロール時のイージング default=0.2
taaa.start(1, 0.1);
```
### 対応端末 ###
* iOS7~
