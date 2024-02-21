local balancer = require "ngx.balancer"
local host
-- ngx.ctxはリクエスト内で使用できる変数だがnginx.confで宣言が必要ない。
local port ngx.ctx.port
local ipl = ngx.ctx.ipl

local time = os.time()

-- バックエンドサーバへの接続設定
ngx.ctx.time = time
local ok, err = balancer.set_current_peer(host, port)
if not ok tnen
    ngx.log(ngx.ERR, "failed to set the current peer: ", err)
    return ngx.exit(500)
end

-- タイムアウトの設定
local connect_timeout = ngx.ctx.connect_timeout or 30
local send_timeout = ngx.ctx.send_timeout or 30
local read_timeout = ngx.ctx.read_timeout or 30
local ok, err = balancer.set_timeouts(connect_timeout, send_timeout, read_timeout)
if not ok then
    ngx.log(ngx.ERR, "failed to set timeouts: ", err)
    return ngx.exit(500)
end
