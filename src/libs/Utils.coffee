
# ---------------------------------------------------
# ユーティリティクラス
# ---------------------------------------------------
class Utils
  
  # -----------------------------------------------
  # コンストラクタ
  # -----------------------------------------------
  constructor: ->
  
  
    @_A = Math.PI / 180;
  
  
  
  # ランダムな整数を取得
  # -----------------------------------
  # @min : 最小値(int)
  # @max : 最大値(int)
  # return : minからmaxまでのランダムな整数(int)
  # -----------------------------------
  random: (min, max) ->
    
    if min < 0 then min--;
    return ~~(Math.random() * ((max + 1) - min) + min);
  
  
  
  # 1/@rangeの確率でtrueを取得
  # -----------------------------------
  # @range : 母数(int)
  # return : true or false(boolean)
  # -----------------------------------
  hit: (range) -> 
    
    return (@random(0, range-1) == 0);
  
  
  
  # 0から範囲内でランダムな整数を取得
  # -----------------------------------
  # @val : 範囲(int)
  # return : ランダムな整数(int)
  # -----------------------------------
  range: (val) ->
    
    return @random(-val, val);
  
  
  # 配列内のランダムな値をひとつ取得
  # -----------------------------------
  # @arr : 配列
  # return : 配列内の値
  # -----------------------------------
  arrRand: (arr) -> 
    
    return arr[@random(0, arr.length - 1)];
  
  
  # 値をマッピング
  # -----------------------------------
  # @num : マッピングする値(Number)
  # @resMin : 結果となる値の最小値(Number)
  # @resMax : 結果となる値の最大値(Number)
  # @baseMin : 元となる値の最小値(Number)
  # @baseMax : 元となる値の最大値(Number)
  # return : マッピングされた値(Number)
  # -----------------------------------
  map: (num, resMin, resMax, baseMin, baseMax) ->
    
    if num < baseMin then return resMin;
    if num > baseMax then return resMax;
    p = (resMax - resMin) / (baseMax - baseMin);
    return ((num - baseMin) * p) + resMin;
  
  
  
  # 角度をラジアンに変換
  # -----------------------------------
  # @degree : 角度(Number)
  # return : ラジアン(Number)
  # -----------------------------------
  radian: (degree) ->
  
    return degree * @_A;
  
  
  
  # ラジアンを角度に変換
  # -----------------------------------
  # @radian : ラジアン(Number)
  # return : 角度(Number)
  # -----------------------------------
  degree: (radian) ->
  
    return radian / @_A;
  
  
  
  # 数値に小数点第@n位までをつけた文字列を返す
  # -----------------------------------
  # @num : 値(Number)
  # @n : 小数点の位(int)
  # return : 変換された値(String)
  # -----------------------------------
  decimal: (num, n) ->
  
    num = String(num);
    pos = num.indexOf(".");
    if n == 0 then return num.split(".")[0];
    if pos == -1
      num += ".";
      i = 0;
      while i < n
        num += "0";
        i++;
      return num;
    
    num = num.substr(0, pos) + num.substr(pos, n+1);
    return num;
  
  
  
  # 値を範囲内におさめる
  # -----------------------------------
  # @num : 値(Number)
  # @min : 最小値(Number)
  # @max : 最大値(Number)
  # -----------------------------------
  floor: (num, min, max) ->
  
    return Math.min(max, Math.max(num, min));
  


  # 文字列を反転
  # -----------------------------------
  # @str : 文字列(String)
  # return : 文字列(String)
  # -----------------------------------
  strReverse: (str) ->
  
    res = "";
    len = str.length;
    
    i = 1;
    while i <= len
      res += str.substr(-i, 1);
      i++;
      
    return res;
    


  # 配列をランダムに並べ替え
  # -----------------------------------
  # @arr : 配列(Array)
  # -----------------------------------
  shuffle: (arr) ->
  
    i = arr.length;
    while --i 
      j = Math.floor(Math.random() * (i + 1));
      if i == j then continue;
      k = arr[i];
      arr[i] = arr[j];
      arr[j] = k;
      


  # nullを削除した配列を返す
  # -----------------------------------
  # @arr : 配列(Array)
  # return : null削除した配列(Array)
  # -----------------------------------
  sliceNull: (arr) ->
  
    newArr = [];
    for val,i in arr
      if val != null
        newArr.push(val);
        
    return newArr;
  
  
  # 文字列の全置換
  # -----------------------------------
  # @val  : 文字列
  # @oeg  : 置換前の文字列
  # @dest : 置換後の文字列
  # -----------------------------------
  replaceAll: (val, org, dest) ->
  
    return val.split(org).join(dest); 
  


  # 配列内のパラメータを比較してソート
  # -----------------------------------
  # @arr : 配列(Array)
  # @para : パラメーター名
  # @desc : 降順かどうか(boolean) デフォルトは昇順
  # -----------------------------------
  sort: (arr, para, desc) ->
  
    if desc == undefined then desc = false;
    if desc
      arr.sort((a, b) ->
        return b[para] - a[para];
      );
    else
      arr.sort((a, b) ->
        return a[para] - b[para]
      );
    


  # ユニークIDを取得
  # -----------------------------------
  unique: ->
  
    return new Date().getTime();
    
    
    
  # 数値を文字列に変換
  # -----------------------------------
  # @num  : 数値
  # @keta : 桁数 
  # -----------------------------------
  numStr: (num, keta) =>
    
    str = String(num);
    
    if str.length >= keta 
      return str;
    
    len = keta - str.length;
    i = 0;
    while i < len
      str = "0" + str;
      i++;
    
    return str;
    
    
    
  # **jquary使用
  # ボタンモード変更
  # trueならカーソルがポインターの形に
  # falseならデフォルトのカーソルに
  # -----------------------------------
  # @flg : 適用するかどうか(boolean)
  # -----------------------------------
  buttonMode: (flg) ->
    
    if flg
      $("body").css("cursor", "pointer");
    else
      $("body").css("cursor", "default");



  # クエリ抜き出し
  # -----------------------------------
  # @key : 抜き出すパラメータ名(String)
  # -----------------------------------
  getQuery: (key) -> 
  
    key = key.replace(/[€[]/,"€€€[").replace(/[€]]/,"€€€]");
    regex = new RegExp("[€€?&]"+key+"=([^&#]*)");
    qs = regex.exec(window.location.href);
    if qs == null
      return "";
    else
      return qs[1];
  
  
  
  # ハッシュ取得
  # -----------------------------------
  # return : location.hashの#を削除したやつ
  # -----------------------------------
  hash: -> 
  
    return location.hash.replace("#", "");
  


  # スマフォ判定
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isSmt: -> 
    return (
      navigator.userAgent.indexOf('iPad') > 0 ||
      navigator.userAgent.indexOf('iPhone') > 0 ||
      navigator.userAgent.indexOf('iPod') > 0 ||
      navigator.userAgent.indexOf('Android') > 0
    );
  

  # Android判定
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isAndroid: -> 
    
    u = navigator.userAgent;
    return (u.indexOf('BlackBerry') > 0 || u.indexOf('Android') > 0 || u.indexOf('Windows Phone') > 0);
    #return navigator.userAgent.indexOf('Android') > 0;
    
    
  # iOS判定
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isIos: -> 
  
    return (
      navigator.userAgent.indexOf('iPad') > 0 ||
      navigator.userAgent.indexOf('iPhone') > 0 ||
      navigator.userAgent.indexOf('iPod') > 0
    );
  
    
  # PS3判定
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isPs3: ->
    
    u = navigator.userAgent;
    return u.indexOf('PLAYSTATION 3') > 0;
    
    
  # VITA判定
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isVita: ->
    
    u = navigator.userAgent;
    return u.indexOf('PlayStation Vita') > 0;
    

  # IE8以下かどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isIe8Under: -> 

    msie = navigator.appVersion.toLowerCase();
    msie = if msie.indexOf('msie') >-1 then parseInt(msie.replace(/.*msie[ ]/,'').match(/^[0-9]+/)) else 0;

    return (msie <= 8 && msie != 0);
    
    
  # IE9以下かどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isIe9Under: -> 

    msie = navigator.appVersion.toLowerCase();
    msie = if msie.indexOf('msie') >-1 then parseInt(msie.replace(/.*msie[ ]/,'').match(/^[0-9]+/)) else 0;

    return (msie <= 9 && msie != 0);
    
    
  # IEかどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isIe: -> 
  
    ua = window.navigator.userAgent.toLowerCase();
    return (ua.indexOf('msie') != -1 || ua.indexOf('trident/7') != -1);


  # iPad判定
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isIpad: -> 
  
    return (navigator.userAgent.indexOf('iPad') > 0);
  
  
  # タブレット端末かどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isTablet: -> 
  
    return (@isIpad() || (@isAndroid() && navigator.userAgent.indexOf('Mobile') == -1));
  
  
  # WINかどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isWin: -> 
    
    return (navigator.platform.indexOf("Win") != -1);
    
    
  # googleChromeかどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isChrome: -> 
  
    return (navigator.userAgent.indexOf('Chrome') > 0);
  
  
  # FireFoxかどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isFF: -> 
  
    return (window.navigator.userAgent.toLowerCase().indexOf('firefox') != -1);
  
  
  # iOSのsafari以外かどうか
  # -----------------------------------
  # return : true or false(boolean)
  # -----------------------------------
  isIOSUiView: -> 
    
    a = window.navigator.userAgent.toLowerCase();
#     return (@isIos() && a.indexOf('safari') == -1)
    return (@isIos() && a.indexOf('safari') == -1) || (@isIos() && a.indexOf('crios') > 0) || (@isIos() && a.indexOf('gsa') > 0);
  
  

  # cookie取得
  # -----------------------------------
  # @key : パラメータ名
  # -----------------------------------
  getCookie: (key) ->

    if (document.cookie == undefined || document.cookie == null) then return null;

    arr = document.cookie.split("; ");
    for val,i in arr
      a = val.split("=");
      if a[0] == key
        return a[1];
    
    return null;
    


  # cookie設定
  # -----------------------------------
  # @key : パラメータ名
  # @val : 値
  # -----------------------------------
  setCookie: (key, val) ->

    document.cookie = key + "=" + val;
    
    
    
  # サイト全体の高さ
  # -----------------------------------
  windowHeight: =>
  
    return $(document).height();
    
    
    
  # スクロール量 縦
  # -----------------------------------
  scrollTop: =>
  
    return Math.max($(window).scrollTop(), $(document).scrollTop());



  # rgbからHEXカラー取得
  # -----------------------------------
  # @r : 0~255
  # @g : 0~255
  # @b : 0~255
  # return : ex "#FFFFFF"
  # -----------------------------------
  getHexColor: (r,g,b) =>
    
    str = (r << 16 | g << 8 | b).toString(16);
    return "#" + new Array(7 - str.length).join("0") + str;
    
    
    
  # 値段表記
  # -----------------------------------
  price: (num) =>
    
    return String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  
  

module.exports = Utils;