

# ---------------------------------------------------
# サインカーブオブジェクト
# ---------------------------------------------------
class Sin
	
	
	# コンストラクタ
	# -----------------------------------------------
	# @target :
	# -----------------------------------------------
	constructor: (base, min, max, speed, angle) ->

		
		@base = base;
		@min = min;
		@max = max;
		@speed = speed;
		@angle = angle
		
		@val = 0;
		
		
		
	# 更新
	# -----------------------------------
	update: ->
		
		@angle += @speed;
		if @angle > 360 then @angle = @angle - 360;
		@val = @base + @_map(Math.sin(@angle * (Math.PI / 180)), @min, @max, -1, 1);
		
		return @val;
		
		
	# 値をマッピング
	# -----------------------------------
	# @num : マッピングする値(Number)
	# @resMin : 結果となる値の最小値(Number)
	# @resMax : 結果となる値の最大値(Number)
	# @baseMin : 元となる値の最小値(Number)
	# @baseMax : 元となる値の最大値(Number)
	# return : マッピングされた値(Number)
	# -----------------------------------
	_map: (num, resMin, resMax, baseMin, baseMax) ->
		
		if num < baseMin then return resMin;
		if num > baseMax then return resMax;
		p = (resMax - resMin) / (baseMax - baseMin);
		return ((num - baseMin) * p) + resMin;
		
		
		
		
		
module.exports = Sin;