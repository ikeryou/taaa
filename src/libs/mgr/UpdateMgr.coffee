BaseMgr = require('./BaseMgr')


# ---------------------------------------------------
# 画面更新管理クラス
# ---------------------------------------------------
class UpdateMgr extends BaseMgr
  
  
  # -----------------------------------------------
  # コンストラクタ
  # -----------------------------------------------
  constructor: (isRAF) ->
    
    super();
    
    # requestAnimationFrame使用
    @_isRAF = isRAF || true;
    
    # 毎フレーム実行させる関数を保持
    @_updateList = [];
    
    # 初期化
    @_init();
    
  
  # -----------------------------------------------
  # 初期化
  # -----------------------------------------------
  _init: =>
    
    super();
    
    if @_isRAF && window.requestAnimationFrame?
      window.requestAnimationFrame(@_update);
    else
      setInterval(@_update, 1000 / 60);
  
  
  # -----------------------------------------------
  # 実行したい関数を登録
  # @func : 関数
  # -----------------------------------------------
  add: (func) ->
  
    @_updateList.push(func);


  # -----------------------------------------------
  # 実行したい関数を削除
  # @func : 関数
  # -----------------------------------------------
  remove: (func) ->
  
    arr = [];
    for val, i in @_updateList
      if val != func
        arr.push(val);
    @_updateList = arr;
    
  
  # -----------------------------------------------
  # 更新
  # -----------------------------------------------
  _update: =>
    
    # 登録してる関数を実行
    for val,i in @_updateList
      val();
    
    if @_isRAF && window.requestAnimationFrame?
      window.requestAnimationFrame(@_update);
  


module.exports = UpdateMgr;