


# ---------------------------------------------------
# imageデータ
# ---------------------------------------------------
class ImgData
  
  
  # コンストラクタ
  # -----------------------------------------------
  # @src      : 画像URL
  # @width    : 幅 def=0
  # @height   : 高さ def=0
  # @isRetina : Retina対応するかどうか def=false
  # -----------------------------------------------
  constructor: (src, width, height, isRetina) ->
    
    # ファイル名
    @src    = src;
    @orgSrc = @src;
    
    # サイズ
    @width     = width || 0;
    @height    = height || 0;
    @orgWidth  = @width;
    @orgHeight = @height;
    
    # Retina対応
    @_isRetina = isRetina || false;
    if @_isRetina
      @width  = ~~(@width * 0.5);
      @height = ~~(@height * 0.5);
      
    # imageオブジェクト
    @_image;
    
    # コールバック 画像読み込み完了
    @onLoad;
    
    
    
  # -----------------------------------
  # 削除
  # -----------------------------------
  dispose: =>
    
    @_image = null;
    @onLoad = null;
    
    
  # -----------------------------------
  # imageオブジェクト取得
  # -----------------------------------
  data: =>
    
    return @_image;

  
  # -----------------------------------
  # 画像読み込み
  # -----------------------------------
  load: =>
    
    @_image = new Image();;
    @_image.onload = @_eLoad;
    @_image.src = @src;

    
  # -----------------------------------
  # imgタグ生成
  # -----------------------------------
  getTag: =>
    
    return "<img src='" + @src + "' width='" + @width + "' height='" + @height + "' alt=''>";
    
  
  # -----------------------------------
  # イベント 画像読み込み完了
  # -----------------------------------
  _eLoad: =>
    
    if @_image?
      
      @width     = @_image.width;
      @height    = @_image.height;
      @orgWidth  = @_image.width;
      @orgHeight = @_image.height;
      
      # Retina対応
      if @_isRetina
        @width  = ~~(@orgWidth * 0.5);
        @height = ~~(@orgHeight * 0.5);
      
      if @onLoad? then @onLoad();
      
    
  # -----------------------------------
  # レティナ設定
  # -----------------------------------
  setRetina: (bool) =>
    
    @_isRetina = bool;
    
    if @_isRetina
      @width  = ~~(@orgWidth * 0.5);
      @height = ~~(@orgHeight * 0.5);
    else
      @width  = @orgWidth;
      @height = @orgHeight;




module.exports = ImgData;