local http = require "resty.http"
local httpc = http.new()

local redirect_rul = "https://google.com"
ngx.redirect(redirect_rul, ngx.HTTP_MOVED_PERMANENTLY)
