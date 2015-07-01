Display = require('./Display')
DisplayTransform = require('./DisplayTransform')
ImgData = require('../img/ImgData')


# ---------------------------------------------------
# 画像表示クラス
# ---------------------------------------------------
class DisplayImg extends DisplayTransform
  
  
  # コンストラクタ
  # -----------------------------------------------
  # @option.src    : 画像ソース
  # @option.retina : レティナ対応 def=false
  # -----------------------------------------------
  constructor: (option) ->
    
    super(option);
    
    @_option.retina = @_option.retina || false;
    
    # 画像データ
    @_imgData;
    
    # コールバック 画像読み込み完了
    @onLoad;
  
  
  # -----------------------------------
  # 初期化
  # -----------------------------------
  init: =>
    
    super();
    
    # 画像データ作成
    @_imgData = new ImgData(@_option.src, 0, 0, @_option.retina);
    @_imgData.onLoad = @_eLoadImg;
    @_imgData.load();
    
    
  # -----------------------------------
  # 破棄
  # -----------------------------------
  dispose: =>
    
    if @_imgData?
      @_imgData.dispose();
      @_imgData = null;
    
    @onLoad = null;
    
    super();
  
  
  # -----------------------------------
  # イベント 画像読み込み完了
  # -----------------------------------
  _eLoadImg: =>
    
    if @_imgData? then @setImg();
    if @onLoad? then @onLoad();
  
  
  # -----------------------------------
  # レティナ設定
  # -----------------------------------
  setRetina: (bool) =>
    
    @_option.retina = bool;
    if @_imgData?
      @_imgData.setRetina(bool);
      @setImg()
    
  
  # -----------------------------------
  # 要素の背景に画像セット
  # -----------------------------------
  setImg: =>
    
    @elm().css({
      backgroundImage:"url('" + @_imgData.src + "')",
      #backgroundSize:@_imgData.width + "px " + @_imgData.height + "px",
      backgroundRepeat:"no-repeat"
    });
    
    # サイズを画像に合わせる
    @size(@_imgData.width, @_imgData.height);
    @render();
  
  
  # -----------------------------------
  # サイズ設定
  # -----------------------------------
  size: (width, height) =>
    
    @_imgData.width = width;
    @_imgData.height = height;
    
    @elm().css({
      backgroundSize:@_imgData.width + "px " + @_imgData.height + "px"
    });
    
    super(width, height);
    
  
  # -----------------------------------
  # もともとの画像サイズ
  # -----------------------------------
  orgSize: =>
    
    if @_option.retina
      return {
        w:~~(@_imgData.orgWidth * 0.5),
        h:~~(@_imgData.orgHeight * 0.5)
      };
    else
      return {
        w:@_imgData.orgWidth,
        h:@_imgData.orgHeight
      };
  
  
  # -----------------------------------
  # 画像ソースの変更
  # -----------------------------------
  changeImgSrc: (src) =>
    
    @_imgData.src = src;
    @setImg();


































module.exports = DisplayImg;