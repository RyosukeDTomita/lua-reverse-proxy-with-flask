local redis = require "resty.redis"
local conf_red = redis:new()
local cjson = require "cjson"

local url = ngx.var.request_url

-- ACLの取得
-- local ok, err = conf_red:connect("127.0.0.1", 6379)
-- if not ok then
--     ngx.log(ngx.ERR, "failed to connect: ", err)
--     ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
--     return
-- end

-- TODO: config_redisよりリバースプロキシからリクエストを転送する先を指定。
-- local ok, err = conf_red:connect("127.0.0.1", 6379)
-- if not ok then
--     ngx.log(ngx.ERR, "failed to connect redis: ", err)
--     return
-- end
-- redisから環境変数を取得
-- local env_str, err = conf_red:get("ENV")
-- if err or env_str == ngx.null then
--     ngx.log(ngx.ERR, "failed to get ENV: ", err)
--     return
-- end
-- local env = cjson.decode(env_str)

local transfer_ip = 127.0.0.1
local transfer_port = 8000
local transfer_path = "/"
local transfer_url = "http://" .. transfer_ip .. ":" .. transfer_port .. transfer_path

-- リクエストを転送する先を設定
ngx.ctx.ip = transfer_ip
ngx.ctx.port = transfer_port
ngx.var.pass = "http://backend_app" .. transfer_ip
