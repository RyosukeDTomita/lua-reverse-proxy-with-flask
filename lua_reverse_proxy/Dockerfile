FROM public.ecr.aws/ubuntu/redis:6.0-22.04_edge as depencencies
RUN <<EOF
apt-get update
apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/openresty.gpg
apt-get -y install lsb-release
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openresty.gpg] http://openresty.org/package/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/openresty.list > /dev/null
apt-get update
apt-get -y install openresty
apt-get -y install lua5.1
# install http lua library
wget -P /usr/local/openresty/luajit/share/lua/5.1/resty/ https://raw.githubusercontent.com/ledgetech/lua-resty-http/master/lib/resty/http.lua
wget -P /usr/local/openresty/luajit/share/lua/5.1/resty/ https://raw.githubusercontent.com/ledgetech/lua-resty-http/master/lib/resty/http_headers.lua
wget -P /usr/local/openresty/luajit/share/lua/5.1/resty/ https://raw.githubusercontent.com/ledgetech/lua-resty-http/master/lib/resty/http_connect.lua
rm -rf /var/lib/apt/lists/*
EOF

FROM depencencies AS app
COPY ./ /usr/local/openresty/lua_reverse_proxy

EXPOSE 80
# Not using daemon mode.
CMD ["openresty", "-g", "daemon off;"]
