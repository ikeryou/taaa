
# ---------------------------------------------------
# 画像読み込みクラス
# ---------------------------------------------------
class ImagesLoader
  
  
  # コンストラクタ
  # -----------------------------------------------
  # @list       : 画像URLリスト
  # @list[].url : URL
  # @list[].id  : ひも付け用ID
  # @num        : 一度に読み込む数
  # -----------------------------------------------
  constructor: (list, num) ->
  
    # private ------
    @_list = list;
    @_num = if !num? then 1 else num;
    
    
    # public ------
    @imgList = {};
    @loadedNum = 0;
    @loaded = false;
    
    @onComplete; 
    @onProgress;
    
    
  # 読み込み開始
  # -----------------------------------
  start: ->
    
    @_load();
    
    
  # 削除
  # -----------------------------------
  dispose: =>
    
    @_list = null;
    @imgList = null;
    @onComplete = null;
    @onProgress = null;


  # Imageオブジェクト取得
  # -----------------------------------
  getImg: (id) ->
    
    return @imgList[id];
      
      
  # 画像の個数を取得
  # -----------------------------------
  imgNum: ->
    
    return @imgList.length;
    
  
  # 画像を指定数ずつ読み込み
  # -----------------------------------
  _load: ->
  
    start = @loadedNum;
    end = Math.min(start + @_num, @_list.length);
    i = start;
    while i < end
      img = new Image();
      o = @_list[i];
      img.src = o.url;
      img.imgLoader = @;
      img.imgLoaderId = o.id;
      img.onload = ->
        @orgWidth  = @width;
        @orgHeight = @height;
        @imgLoader._loadedImg(@imgLoaderId);
      ;
      @imgList[o.id] = img;
      i++;
        
  
  
  # 画像読み込み
  # -----------------------------------
  _loadedImg: ->
    
    @loadedNum++;
    if @onProgress?
      @onProgress((@loadedNum / @_list.length) * 100);
    
    if @loadedNum >= @_list.length
      @loaded = true;
      if @onComplete?
        @onComplete();
      return;
    
    if @loadedNum % @_num == 0 then @_load();











module.exports = ImagesLoader;