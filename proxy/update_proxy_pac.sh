#!/bin/bash

# 获取当前电脑的IP地址
current_ip=$(ipconfig getifaddr en0)  # en0是常用的网卡接口，根据需要可以更改为其他接口

# 替换代码中的current_ip
proxy_code=$(cat <<EOF
function FindProxyForURL(url, host) {
    var ip = '${current_ip}:8888';
    return 'PROXY ' + ip + '; DIRECT';
}
EOF
)

# 获取脚本所在目录的路径
script_dir=$(cd "$(dirname "$0")" && pwd)

# 将结果写入charles_proxy.pac文件
echo "$proxy_code" > "$script_dir/charles_proxy.pac"

echo "Proxy PAC 文件已更新。"

# 提交到Git并推送
cd "$script_dir"  # 切换到脚本所在目录
git add charles_proxy.pac
git commit -m "Update charles_proxy.pac"
git push

echo "提交并推送完成。"