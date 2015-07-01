UpdateMgr = require('./libs/mgr/UpdateMgr');
Utils = require('./libs/Utils');


# ------------------------------------
# 
# ------------------------------------
class TAAA
  
  # ------------------------------------
  # コンストラクタ
  # ------------------------------------
  constructor: ->
    
    @_orientation = {
      s:0,
      v:0,
      v2:0,
      num:0
    };
    
    @_lap;
    @_ease;
  
  
  
  # ------------------------------------
  # 監視の開始
  # @lap : 何周で一番下まで到達するか
  # @ease : スクロール時のイージング
  # ------------------------------------
  start: (lap, ease) =>
    
    @_lap = lap || 1;
    @_ease = ease || 0.2;
    
    # app専用オブジェクト
    window.MY = {};
    
    # ユーティリティー
    window.MY.u = new Utils();
    
    # 画面更新管理
    window.MY.update = new UpdateMgr();
    
     # 対応OSチェック
    if !MY.u.isIos()
      return;
    
    document.body.scrollTop = 0;
    
    # 指でのスクロールを無効に
    window.addEventListener("touchmove", (e) =>
      e.preventDefault();
    );
    
    # 端末の向いてる方角を取得
    window.addEventListener("deviceorientation", @_eDeviceOrientation);
    
    # 画面が更新されるごとに実行
    MY.update.add(@_update);
  
  
  
  # ------------------------------------
  # 方角を取得
  # ------------------------------------
  _eDeviceOrientation: (e) =>
    
    heading = e.webkitCompassHeading;
    if heading?
      
      # 最初に向いてる方向
      if @_orientation.s == 0
        @_orientation.s = heading;
      
      heading = heading - @_orientation.s;
      
      if @_orientation.v2 - heading > 300
        @_orientation.num++;
      
      if heading - @_orientation.v2 > 300
        @_orientation.num--;
      
      @_orientation.v2 = heading;
      @_orientation.v = Math.max(0, @_orientation.num * 360 + heading);
  
  
  
  # ------------------------------------
  # 画面更新
  # ------------------------------------
  _update: =>
    
    pct = @_orientation.v / (360 * @_lap);
    
    # 移動量の最大値
    max = Math.max(0, document.documentElement.scrollHeight - window.innerHeight);
    
    t = max * pct;
    document.body.scrollTop += (t - document.body.scrollTop) * @_ease;
    


























window.TAAA = TAAA;