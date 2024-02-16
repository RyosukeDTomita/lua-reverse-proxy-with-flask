if ngx.var.upstream_response_time ~= nil then
    -- response_timeの末尾に%s:%sが含まれているため削除
    local response_time = string.gsub(ngx.var.upstream_response_time, "%s:%s",
                                      "")
    ngx.var.upstream_response_time = response_time
end
