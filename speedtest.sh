#!/bin/bash


######### 自定义常量 ##########

_constant() {
    script_version="v2023-09-04"
    old_IFS="$IFS"
    work_dir="./sp-github-i-abc"
    node_set=""
    node_set_1="https://github.com/i-abc/Speedtest/raw/node/all-node.txt"
    node_set_2="https://jihulab.com/i-abc/speedtest/-/raw/node/all-node-mirror.txt"

    # url_1为官方源，url_2为镜像源，皆会进行SHA-256检测

    # speedtest-cli，https://www.speedtest.net/zh-Hans/apps/cli
    speedtest_cli_version="1.2.0"
    speedtest_cli_tar_x86_64_sha256="5690596c54ff9bed63fa3732f818a05dbc2db19ad36ed68f21ca5f64d5cfeeb7"
    speedtest_cli_tar_i386_sha256="9ff7e18dbae7ee0e03c66108445a2fb6ceea6c86f66482e1392f55881b772fe8"
    speedtest_cli_tar_aarch64_sha256="3953d231da3783e2bf8904b6dd72767c5c6e533e163d3742fd0437affa431bd3"
    speedtest_cli_tar_armhf_sha256="e45fcdebbd8a185553535533dd032d6b10bc8c64eee4139b1147b9c09835d08d"
    speedtest_cli_tar_armel_sha256="629a455a2879224bd0dbd4b36d8c721dda540717937e4660b4d2c966029466bf"
    speedtest_cli_tar_url=""
    speedtest_cli_tar_url_1="https://install.speedtest.net/app/cli/ookla-speedtest-${speedtest_cli_version}-linux-${speedtest_cli_arch}.tgz"
    speedtest_cli_tar_url_2="https://jihulab.com/i-abc/speedtest/-/raw/asset/speedtest-cli/ookla-speedtest-${speedtest_cli_version}-linux-${speedtest_cli_arch}.tgz"

    # bim-core，https://github.com/veoco/bim-core
    bim_core_version="0.15.2"
    bim_core_tar_x86_64_sha256="14fb41e92d0c3cefe3aa007b4b3aaad5d914f23784f9a34a0dc3d8abee5b6cd3"
    bim_core_tar_aarch64_sha256="53fb1ab43a5cbede001e4d99c4a5dbc6cee9c2f10c7485f10304e7b78560ec78"
    bim_core_tar_url=""
    bim_core_tar_url_1="https://github.com/veoco/bim-core/releases/download/v${bim_core_version}/bimc-${bim_core_arch}-unknown-linux-musl"
    bim_core_tar_url_2="https://jihulab.com/i-abc/speedtest/-/raw/asset/bim-core/bimc-${bim_core_arch}-unknown-linux-musl"

    # speedtest-go，https://github.com/showwin/speedtest-go
    speedtest_go_version="1.6.5"
    speedtest_go_tar_x86_64_sha256="125c95cb748667a88afca9c9c77fd2f8b6b5af26d8eb99d057640dcf5e632131"
    speedtest_go_tar_i386_sha256="d5b0af2d859c9b7b25aed97271289e5f1190673bd82dbf83d274cd337736edee"
    speedtest_go_tar_arm64_sha256="532c7b1e3b5b04e0af22e9703633bd9197e69e4e6bc46b549ee8549c01018602"
    speedtest_go_tar_armv7_sha256="52938232a4cd0d79be493541a748f555b23542b34a252d0546f1f0d00ff123d0"
    speedtest_go_tar_armv6_sha256="29f4eb5cbfa821aff99897e09ca59e0d8f1e6fb5493ca11e5f14b1705f79b01a"
    speedtest_go_tar_url=""
    speedtest_go_tar_url_1="https://github.com/showwin/speedtest-go/releases/download/v${speedtest_go_version}/speedtest-go_${speedtest_go_version}_Linux_${speedtest_go_arch}.tar.gz"
    speedtest_go_tar_url_2="https://jihulab.com/i-abc/speedtest/-/raw/asset/speedtest-go/speedtest-go_${speedtest_go_version}_Linux_${speedtest_go_arch}.tar.gz"

    # librespeed-cli，https://github.com/librespeed/speedtest-cli
    librespeed_cli_version="1.0.10"
    librespeed_cli_tar_amd64_sha256="8e6d020c17e11dba73f0eb8a11f7ae6e3d96cdb307faf3c0ec13aa54e0cba055"
    librespeed_cli_tar_386_sha256="0121bd4a21786d5964643b00a4193edfa15389050afe5579a290e67b706ef9eb"
    librespeed_cli_tar_arm64_sha256="0ecbb98abb39f17bde2c0efae23f8446f4596c3a824aa6dda9b71723386b03ed"
    librespeed_cli_tar_armv7_sha256="b121733b9a18aa646a16393396dd7fe59e8773420a38acb05b91652c4d6cb356"
    librespeed_cli_tar_armv6_sha256="def98bbf0e79805411bca312e9e6bcddd12cd0abf4e6584a3ae05aa20c762b64"
    librespeed_cli_tar_url=""
    librespeed_cli_tar_url_1="https://github.com/librespeed/speedtest-cli/releases/download/v${librespeed_cli_version}/librespeed-cli_${librespeed_cli_version}_linux_${librespeed_cli_arch}.tar.gz"
    librespeed_cli_tar_url_2="https://jihulab.com/i-abc/speedtest/-/raw/asset/librespeed-cli/librespeed-cli_${librespeed_cli_version}_linux_${librespeed_cli_arch}.tar.gz"

    # 配色
    red='\033[1;31m'
    green='\033[1;32m'
    yellow='\033[1;33m'
    blue='\033[1;34m'
    purple='\033[1;35m'
    cyan='\033[1;36m'
    endc='\033[0m'
}


########## 横幅 ###########

_print_banner_1() {
     echo "------------------------ 多功能 自更新 测速脚本 ------------------------"
     echo -e " Version               : ${green}${script_version}${endc}"
     echo -e " Usage                 : ${yellow}bash <(curl -sL bash.icu/speedtest)${endc}"
     echo -e " GitHub                : ${green}https://github.com/i-abc/speedtest${endc}"
     printf "%-72s\n" "-" | sed 's)\s)-)g'
 }

_print_banner_2() {
    if [ -s "$work_dir"/banner-custom.txt ]; then
        cat "$work_dir"/banner-custom.txt
        printf "%-72s\n" "-" | sed 's)\s)-)g'
    fi
}

_print_banner_3() {
    printf "%-s%-s%-s%-s%-s\n" "测速节点            " "下载/Mbps      " "上传/Mbps      " "延迟/ms      " "抖动/ms"
}

_print_banner_4() {
    printf "%-72s\n" "-" | sed 's)\s)-)g'
    echo "当前时间：$(date +"%Y-%m-%d %H:%M:%S %Z")"
    echo "北京时间: $(TZ=Asia/Shanghai date --rfc-3339=seconds)"
    printf "%-72s\n" "-" | sed 's)\s)-)g'
    echo
}


########## 确认架构及其对应版本的程序 ##########

_check_architecture() {
    speedtest_cli_arch=""
    bim_core_archh=""
    speedtest_go_arch=""
    librespeed_cli_arch=""
    local arch
    arch="$( uname -m )"
    if [ "$arch" == "x86_64" ]; then
        speedtest_cli_arch="x86_64"
        bim_core_arch="x86_64"
        speedtest_go_arch="x86_64"
        librespeed_cli_arch="amd64"
    elif [ "$arch" == "i386" ] || [ "$arch" == "i686" ]; then
        speedtest_cli_arch="i386"
        speedtest_go_arch="i386"
        librespeed_cli_arch="386"
    elif [ "$arch" == "armv8" ] || [ "$arch" == "armv8l" ] || [ "$arch" == "aarch64" ] || [ "$arch" == "arm64" ]; then
        speedtest_cli_arch="aarch64"
        bim_core_arch="aarch64"
        speedtest_go_arch="arm64"
        librespeed_cli_arch="arm64"
    elif [ "$arch" == "armv7" ] || [ "$arch" == "armv7l" ]; then
        speedtest_cli_arch="armhf"
        speedtest_go_arch="armv7"
        librespeed_cli_arch="armv7"
    elif [ "$arch" == "armv6" ]; then
        speedtest_cli_arch="armel"
        speedtest_go_arch="armv6"
        librespeed_cli_arch="armv6"
    fi
}


########## 检测地区，指定下载源 ##########

_check_region() {
    local country
    country=$( curl -4 "https://ipinfo.io/country" 2> /dev/null )
    if [ -z "$country" ] || echo "$country" | grep "{"; then
        echo "使用镜像源"
        node_set="$node_set_2"
        speedtest_cli_tar_url="$speedtest_cli_tar_url_2"
        bim_core_tar_url="$bim_core_tar_url_2"
        speedtest_go_tar_url="$speedtest_go_tar_url_2"
        librespeed_cli_tar_url="$librespeed_cli_tar_url_2"
    elif [ "$country" != "CN" ]; then
        echo "使用默认源"
        node_set="$node_set_1"
        speedtest_cli_tar_url="$speedtest_cli_tar_url_1"
        bim_core_tar_url="$bim_core_tar_url_1"
        speedtest_go_tar_url="$speedtest_go_tar_url_1"
        librespeed_cli_tar_url="$librespeed_cli_tar_url_1"
    else
        echo "使用镜像源"
        node_set="$node_set_2"
        speedtest_cli_tar_url="$speedtest_cli_tar_url_2"
        bim_core_tar_url="$bim_core_tar_url_2"
        speedtest_go_tar_url="$speedtest_go_tar_url_2"
        librespeed_cli_tar_url="$librespeed_cli_tar_url_2"
    fi
}


########## 检测某软件包是否安装，没安则自动安上，目前只支持RedHat、Debian系 ##########

_check_package() {
    echo "正在检测所需的$1是否安装"
    # 检测软件包是否安装
    if ! command -v "$1"; then
        # 确认包管理器并安装软件包
        if command -v dnf; then
            dnf -y install "$2"
        elif command -v yum; then
            yum -y install "$2"
        elif command -v apt; then
            apt -y install "$2"
        else
            echo "本机非RedHat、Debian系，暂不支持自动安装所需的软件包"
            exit 1
        fi
        # 再次检测软件包是否安装
        if ! command -v "$1"; then
            echo "自动安装所需的$1失败"
            echo "请手动安装$1后再执行本脚本"
            exit 1
        fi
    fi
}


########## 创建工作目录 ##########

_make_dir() {
    # 删除可能存在的残余文件
    rm -rf "$work_dir"
    # 创建目录
    mkdir "$work_dir"
}


########## 下载程序 ##########

_download_tar() {
    echo "$speedtest_cli_tar_url"
    echo "speedtest-cli下载中"
    curl --progress-bar -o "$work_dir"/speedtest-cli.tgz -L "$speedtest_cli_tar_url"
    echo "$bim_core_tar_url"
    echo "bim-core下载中"
    curl --progress-bar -o "$work_dir"/bim-core -L "$bim_core_tar_url"
    echo "$speedtest_go_tar_url"
    echo "speedtest-go下载中"
    curl --progress-bar -o "$work_dir"/speedtest-go.tar.gz -L "$speedtest_go_tar_url"
    echo "$librespeed_cli_tar_url"
    echo "librespeed-cli下载中"
    curl --progress-bar -o "$work_dir"/librespeed-cli.tar.gz -L "$librespeed_cli_tar_url"
}


########## 检测程序的SHA-256 ##########

_check_tar_sha256() {
    local speedtest_cli_tar_download_sha256 bim_core_tar_download_sha256 speedtest_go_tar_download_sha256 librespeed_cli_tar_download_sha256
    speedtest_cli_tar_download_sha256=$( sha256sum "$work_dir"/speedtest-cli.tgz | awk '{ print $1 }' )
    bim_core_tar_download_sha256=$( sha256sum "$work_dir"/bim-core | awk '{ print $1 }' )
    speedtest_go_tar_download_sha256=$( sha256sum "$work_dir"/speedtest-go.tar.gz | awk '{ print $1 }' )
    librespeed_cli_tar_download_sha256=$( sha256sum "$work_dir"/librespeed-cli.tar.gz | awk '{ print $1 }' )
    if [ "$speedtest_cli_tar_download_sha256" != "$( eval "echo \$speedtest_cli_tar_${speedtest_cli_arch}_sha256" )" ]; then
        printf "${red}%-s${endc}\n" "经检测，speedtest-cli的SHA-256与官方不符，方便的话欢迎到GitHub反馈"
        exit 1
    fi
    if [ "$bim_core_tar_download_sha256" != "$( eval "echo \$bim_core_tar_${bim_core_arch}_sha256" )" ]; then
        printf "${red}%-s${endc}\n" "经检测，bim-core的SHA-256与官方不符，方便的话欢迎到GitHub反馈"
        exit 1
    fi
    if [ "$speedtest_go_tar_download_sha256" != "$( eval "echo \$speedtest_go_tar_${speedtest_go_arch}_sha256" )" ]; then
        printf "${red}%-s${endc}\n" "经检测，speedtest-go的SHA-256与官方不符，方便的话欢迎到GitHub反馈"
        exit 1
    fi
    if [ "$librespeed_cli_tar_download_sha256" != "$( eval "echo \$librespeed_cli_tar_${librespeed_cli_arch}_sha256" )" ]; then
        printf "${red}%-s${endc}\n" "经检测，librespeed-cli的SHA-256与官方不符，方便的话欢迎到GitHub反馈"
        exit 1
    fi
}


########## 解压程序 ##########

_unzip_tar() {
    tar -xf "$work_dir"/speedtest-cli.tgz -C "$work_dir"
    tar -xf "$work_dir"/speedtest-go.tar.gz -C "$work_dir"
    tar -xf "$work_dir"/librespeed-cli.tar.gz -C "$work_dir"
    chmod +x "$work_dir"/bim-core
}



########## 获取节点列表 ##########

_get_node_list() {
    # 节点集合
    local node_url node_selection_1 node_selection_2 node_selection_3 first_line second_line
    _print_banner_1; echo -e "${blue}↓    ↓    ↓    ↓    ↓    ↓   测速节点列表   ↓    ↓    ↓    ↓    ↓    ↓${endc}"
    echo -e "0. \033[1m自定义测速节点\033[0m"
    curl -sL "$node_set" | awk '$0!~/http/{print}'
    printf "${yellow}%-s${endc}" "请输入您想选择的节点序号: "
    read -r node_selection_1
    # 某类节点
    if [ "$node_selection_1" -ne 0 ]; then
        node_url=$(curl -sL "$node_set" | awk -F. "\$1== $node_selection_1 { getline; print }")
        curl -o "$work_dir"/all-node.txt -L "$node_url"
    elif [ "$node_selection_1" -eq 0 ]; then
        printf "${yellow}%-s${endc}" "请输入您的自定义节点链接(http或本地绝对路径): "
        read -r node_url_custom
        # 判断自定义节点是网络链接还是本地文件
        # 网络，http
        if [[ "$node_url_custom" =~ \w{0}https?:// ]]; then
            first_line="$( curl -sL "$node_url_custom" | awk -F'.' NR==1'{ print $1 }' )"
            second_line="$( curl -sL "$node_url_custom" | awk NR==2 )"
            if [ "$first_line" -eq 1 ] &> /dev/null && echo "$second_line" | grep -q -E "\w{0}https?://" &> /dev/null; then
                node_set="$node_url_custom"
                curl -sL "$node_set" | awk '$0!~/http/{print}'
                printf "${yellow}%-s${endc}" "请输入您想选择的节点序号: "
                read -r node_selection_2
                node_url=$(curl -sL "$node_set" | awk -F. "\$1== $node_selection_2 { getline; print }")
                curl -o "$work_dir"/all-node.txt -L "$node_url"
            else
                node_url="$node_url_custom"
                curl -o "$work_dir"/all-node.txt -L "$node_url"
            fi
        # 本地，绝对路径
        elif [[ "$node_url_custom" =~ \w{0}/{1} ]]; then
            first_line="$( awk -F'.' NR==1'{ print $1 }' < "$node_url_custom" )"
            second_line="$( awk NR==2 < "$node_url_custom" )"
            if [ "$first_line" -eq 1 ] &> /dev/null && echo "$second_line" | grep -q -E "\w{0}/{1}" &> /dev/null; then
                node_set="$node_url_custom"
                awk '$0!~/^\//{print}' < "$node_set"
                printf "${yellow}%-s${endc}" "请输入您想选择的节点序号: "
                read -r node_selection_3
                node_url="$( awk -F. "\$1== $node_selection_3 { getline; print }" < "$node_set" )"
                cp -f "$node_url" "$work_dir"/all-node.txt
            else
                node_url="$node_url_custom"
                cp -f "$node_url" "$work_dir"/all-node.txt
            fi
        fi
    fi
}


########## 分类节点 ###########

_classify_node() {
    # 总行数
    local row_num
    row_num=$( wc -l "$work_dir"/all-node.txt | awk '{print $1}' )
    # 分类
    for (( i = 1; i <= row_num; i++ )); do
        # 第一列
        local first_column
        first_column=$( awk -F, NR==${i}'{print $1}' "$work_dir"/all-node.txt )
        # speedtest-cli
        if [[ "$first_column" =~ "speedtest-cli" ]]; then
            awk NR==${i} "$work_dir"/all-node.txt >> "$work_dir"/speedtest-cli-node.txt
        # bim-core
        elif [[ "$first_column" =~ "bim-core" ]]; then
            awk NR==${i} "$work_dir"/all-node.txt >> "$work_dir"/bim-core-node.txt
        # speedtest-go
        elif [[ "$first_column" =~ "speedtest-go" ]]; then
            awk NR==${i} "$work_dir"/all-node.txt >> "$work_dir"/speedtest-go-node.txt
        # librespeed-cli
        elif [[ "$first_column" =~ "librespeed-cli" ]]; then
            awk NR==${i} "$work_dir"/all-node.txt >> "$work_dir"/librespeed-cli-node.txt
        # iperf3
        elif [[ "$first_column" =~ "iperf3" ]]; then
            awk NR==${i} "$work_dir"/all-node.txt >> "$work_dir"/iperf3-node.txt
        # 自定义的横幅
        elif [ "$first_column" != "" ]; then
            awk NR==${i} "$work_dir"/all-node.txt >> "$work_dir"/banner-custom.txt
        fi
    done
}



########## speedtest-cli ##########

_speedtest_cli_test() {
    # speedtest-cli的选项、参数
    awk -F, '{ print $3 }' "$work_dir"/speedtest-cli-node.txt > "$work_dir"/speedtest-cli-option.txt
    _filter_option_speedtest_cli "$work_dir"/speedtest-cli-option.txt "$work_dir"/speedtest-cli-option-filter.txt
    # speedtest-cli测试、输出
    local option_para count=1
    while IFS= read -r option_para; do
        IFS="$old_IFS"
        local download_c="15" upload_c="15" latency_c="13" jitter_c="13"
        local node_name latency jitter download upload download upload
        # speedtest-cli测试
        "$work_dir"/speedtest --accept-license --accept-gdpr -f json-pretty $option_para > "$work_dir"/speedtest-cli-"$count".json 2> "$work_dir"/speedtest-cli-"$count"-error.json
        # speedtest-cli输出
        if [ -s "$work_dir"/speedtest-cli-"$count".json ]; then
            # 节点名称
            node_name=$( awk -F, NR=="$count"'{ print $2 }' "$work_dir"/speedtest-cli-node.txt )
            # 延迟，ms
            latency="$( awk -F': |,' '/ping/{ getline; getline; print $2 }' "$work_dir"/speedtest-cli-"$count".json )"
            _check_num "$latency" || latency=" 失败"
            _check_num "$latency" || latency_c="15"
            _check_num "$latency" && latency="$( printf "%.2f" "$latency" ) ms"
            # 抖动，ms
            jitter="$( awk -F': |,' '/ping/{ getline; print $2 }' "$work_dir"/speedtest-cli-"$count".json )"
            _check_num "$jitter" || jitter=" 失败"
            _check_num "$jitter" || jitter_c="15"
            _check_num "$jitter" && jitter="$( printf "%.2f" "$jitter" ) ms"
            # 下载速度，bps->Mbps
            download="$( awk -F': |,' '/download/{ getline; print $2 }' "$work_dir"/speedtest-cli-"$count".json )"
            _check_num "$download" || download="  失败"
            _check_num "$download" || download_c="17"
            _check_num "$download" && download="$( echo "scale=2; $download / 125000" | bc )" && download="$( printf "%.2f" "$download" ) Mbps"
            # 上传速度，bps->Mbps
            upload="$( awk -F': |,' '/upload/{ getline; print $2 }' "$work_dir"/speedtest-cli-"$count".json )"
            _check_num "$upload" || upload="  失败"
            _check_num "$upload" || upload_c="17"
            _check_num "$upload" && upload="$( echo "scale=2; $upload / 125000" | bc )" && upload="$( printf "%.2f" "$upload" ) Mbps"
            # 输出结果
            [ -s "$work_dir"/speedtest-cli-"$count".json ] && _check_output
        fi
        count=$(( count + 1 ))
    done < "$work_dir"/speedtest-cli-option-filter.txt
}


########## bim-core ##########

_bim_core_test() {
    # bim-core的选项、参数
    awk -F, '{ print $3 }' "$work_dir"/bim-core-node.txt > "$work_dir"/bim-core-option.txt
    _filter_option_bim_core "$work_dir"/bim-core-option.txt "$work_dir"/bim-core-option-filter.txt
    # bim-core测试、输出
    local option_para count=1
    while IFS= read -r option_para; do
        IFS="$old_IFS"
        local download_c="15" upload_c="15" latency_c="13" jitter_c="13"
        local node_name latency jitter download upload download upload
        # bim-core测试
        "$work_dir"/bim-core $option_para > "$work_dir"/bim-core-"$count".json 2> "$work_dir"/bim-core-"$count"-error.json
        # bim-core输出
        if [ -s "$work_dir"/bim-core-"$count".json ]; then
            # 节点名称
            node_name=$( awk -F, NR=="$count"'{ print $2 }' "$work_dir"/bim-core-node.txt )
            # 延迟，ms
            latency="$( awk '{ print $5 }' "$work_dir"/bim-core-"$count".json | awk -F',' '{ print $1 }' )"
            _check_num "$latency" || latency=" 失败"
            _check_num "$latency" || latency_c="15"
            _check_num "$latency" && latency="$( printf "%.2f" "$latency" ) ms"
            # 抖动，ms
            jitter="$( awk '{ print $6 }' "$work_dir"/bim-core-"$count".json )"
            _check_num "$jitter" || jitter=" 失败"
            _check_num "$jitter" || jitter_c="15"
            _check_num "$jitter" && jitter="$( printf "%.2f" "$jitter" ) ms"
            # 下载速度
            download="$( awk '{ print $3 }' "$work_dir"/bim-core-"$count".json | awk -F',' '{ print $1 }' )"
            _check_num "$download" || download="  失败"
            _check_num "$download" || download_c="17"
            _check_num "$download" && download="$( printf "%.2f" "$download" ) Mbps"
            # 上传速度
            upload="$( awk '{ print $1 }' "$work_dir"/bim-core-"$count".json | awk -F',' '{ print $1 }' )"
            _check_num "$upload" || upload="  失败"
            _check_num "$upload" || upload_c="17"
            _check_num "$upload" && upload="$( printf "%.2f" "$upload" ) Mbps"
            # 输出结果
            [ -s "$work_dir"/bim-core-"$count".json ] && _check_output
        fi
        count=$(( count + 1 ))
    done < "$work_dir"/bim-core-option-filter.txt
}


########## speedtest-go ##########

_speedtest_go_test() {
    # speedtest-go的选项、参数
    awk -F, '{ print $3 }' "$work_dir"/speedtest-go-node.txt > "$work_dir"/speedtest-go-para.txt
    _filter_option_speedtest_go "$work_dir"/speedtest-go-para.txt "$work_dir"/speedtest-go-para-filter.txt
    # speedtest-go测试、输出
    local option_para
    local count=1
    while IFS= read -r option_para; do
        IFS="$old_IFS"
        local download_c="15" upload_c="15" latency_c="13" jitter_c="13"
        # speedtest-go测试
        local node_name latency jitter download upload
        "$work_dir"/speedtest-go $option_para > "$work_dir"/speedtest-go-"$count".json 2> "$work_dir"/speedtest-go-"$count"-error.json
        # speedtest-go输出
        if [ -s "$work_dir"/speedtest-go-"$count".json ] && ! grep -q "Fatal" "$work_dir"/speedtest-go-"$count".json; then
            local node_name latency jitter download upload
            # 节点名称
            node_name="$( awk -F, NR=="$count"'{ print $2 }' "$work_dir"/speedtest-go-node.txt )"
            # 延迟，ms
            latency="$( awk -F' |ms|µs' '/Latency/{ print $3 }' "$work_dir"/speedtest-go-"$count".json )"
            if awk -F'Latency: ' /Latency/'{ print $2 }' "$work_dir"/speedtest-go-"$count".json | awk -F' Jitter: ' '{ print $1 }' | grep -q µs; then
                latency_unit="µs"
            elif awk -F'Latency: ' /Latency/'{ print $2 }' "$work_dir"/speedtest-go-"$count".json | awk -F' Jitter: ' '{ print $1 }' | grep -q ms; then
                latency_unit="ms"
            fi
            _check_num "$latency" || latency=" 失败"
            _check_num "$latency" || latency_c="15"
            _check_num "$latency" && latency="$( printf "%.2f" "$latency" ) $latency_unit"
            # 抖动，ms
            jitter="$( awk -F' |ms|µs' '/Jitter/{ print $6 }' "$work_dir"/speedtest-go-"$count".json )"
            if awk -F'Jitter: ' /Jitter/'{ print $2 }' "$work_dir"/speedtest-go-"$count".json | awk -F' Min: ' '{ print $1 }' | grep -q µs; then
                jitter_unit="µs"
            elif awk -F'Jitter: ' /Jitter/'{ print $2 }' "$work_dir"/speedtest-go-"$count".json | awk -F' Min: ' '{ print $1 }' | grep -q ms; then
                jitter_unit="ms"
            fi
            _check_num "$jitter" || jitter=" 失败"
            _check_num "$jitter" || jitter_c="15"
            _check_num "$jitter" && jitter="$( printf "%.2f" "$jitter" ) $jitter_unit"
            # 下载、上传速度，Mbps
            download="$( awk -F' |Mbps' '/Download/{ print $3 }' "$work_dir"/speedtest-go-"$count".json )"
            _check_num "$download" || download="  失败"
            _check_num "$download" || download_c="17"
            _check_num "$download" && download="$( printf "%.2f" "$download" ) Mbps"
            upload="$( awk -F' |Mbps' '/Upload/{ print $3 }' "$work_dir"/speedtest-go-"$count".json )"
            _check_num "$upload" || upload="  失败"
            _check_num "$upload" || upload_c="17"
            _check_num "$upload" && upload="$( printf "%.2f" "$upload" ) Mbps"
            _check_option "--no-upload" "$option_para" && upload="  跳过"
            _check_option "--no-upload" "$option_para" && upload_c="17"
            _check_option "--no-download" "$option_para" && download="  跳过"
            _check_option "--no-download" "$option_para" && download_c="17"
            # 输出结果
            [ -s "$work_dir"/speedtest-go-"$count".json ] && _check_output
        fi
        count=$(( count + 1 ))
    done < "$work_dir"/speedtest-go-para-filter.txt
}


########## librespeed-cli ##########

_librespeed_cli_test() {
    # librespeed-cli的选项、参数
    awk -F, '{ print $3 }' "$work_dir"/librespeed-cli-node.txt > "$work_dir"/librespeed-cli-para.txt
    _filter_option_librespeed_cli "$work_dir"/librespeed-cli-para.txt "$work_dir"/librespeed-cli-para-filter.txt
    # librespeed-cli测试、输出
    local option_para
    local count=1
    while IFS= read -r option_para; do
        IFS="$old_IFS"
        local download_c="15" upload_c="15" latency_c="13" jitter_c="13"
        # librespeed-cli测试
        local node_name latency jitter download upload
        "$work_dir"/librespeed-cli --json $option_para > "$work_dir"/librespeed-cli-"$count".json 2> "$work_dir"/librespeed-cli-"$count"-error.json
        # librespeed-cli输出
        if [ -s "$work_dir"/librespeed-cli-"$count".json ]; then
            # 节点名称
            node_name=$( awk -F, NR=="$count"'{ print $2 }' "$work_dir"/librespeed-cli-node.txt )
            # 延迟，ms
            latency="$( awk -F'"ping":' '{ print $2 }' "$work_dir"/librespeed-cli-"$count".json | awk -F',' '{ print $1 }' )"
            _check_num "$latency" || latency=" 失败"
            _check_num "$latency" || latency_c="15"
            _check_num "$latency" && latency="$( printf "%.2f" "$latency" ) ms"
            # 抖动，ms
            jitter="$( awk -F'"jitter":' '{ print $2 }' "$work_dir"/librespeed-cli-"$count".json | awk -F',' '{ print $1 }' )"
            _check_num "$jitter" || jitter=" 失败"
            _check_num "$jitter" || jitter_c="15"
            _check_num "$jitter" && jitter="$( printf "%.2f" "$jitter" ) ms"
            # 下载、上传速度，Mbps
            download="$( awk -F'"download":' '{ print $2 }' "$work_dir"/librespeed-cli-"$count".json | awk -F',' '{ print $1 }' )"
            _check_num "$download" || download="  失败"
            _check_num "$download" || download_c="17"
            _check_num "$download" && download="$( printf "%.2f" "$download" ) Mbps"
            upload="$( awk -F'"upload":' '{ print $2 }' "$work_dir"/librespeed-cli-"$count".json | awk -F',' '{ print $1 }')"
            _check_num "$upload" || upload="  失败"
            _check_num "$upload" || upload_c="17"
            _check_num "$upload" && upload="$( printf "%.2f" "$upload" ) Mbps"
            _check_option "--no-upload" "$option_para" && upload="  跳过"
            _check_option "--no-upload" "$option_para" && upload_c="17"
            _check_option "--no-download" "$option_para" && download="  跳过"
            _check_option "--no-download" "$option_para" && download_c="17"
            # 输出结果
            [ -s "$work_dir"/librespeed-cli-"$count".json ] && _check_output
        fi
        count=$(( count + 1 ))
    done < "$work_dir"/librespeed-cli-para-filter.txt
}


########## iperf3 ##########

_iperf3_test() {
    # iperf3的选项、参数
    awk -F',' '{ print $3 }' "$work_dir"/iperf3-node.txt > "$work_dir"/iperf3-para.txt
    _filter_option_iperf3 "$work_dir"/iperf3-para.txt "$work_dir"/iperf3-para-filter.txt
    # iperf3测试、输出
    local option_para
    local count=1
    while IFS= read -r option_para; do
        IFS="$old_IFS"
        local download_c="15" upload_c="15" latency_c="13" jitter_c="13"
        # iperf3测试
        local node_name latency jitter download upload
        if _check_option "--up-and-down" "$option_para"; then
        # 双向
            option_para="$( echo "$option_para" | awk -F'--up-and-down' '{ print $1 $2 }' )"
            # 节点名称
            node_name=$( awk -F, NR=="$count"'{ print $2 }' "$work_dir"/iperf3-node.txt )
            # 延迟，ms
            latency=" 跳过"
            latency_c="15"
            # 抖动，ms
            jitter=" 跳过"
            jitter_c="15"
            # 上传
            local i_busy
            for (( i_busy=1; i_busy<=65; i_busy++ )); do
                iperf3 -f m $option_para > "$work_dir"/iperf3-"$count".json 2> "$work_dir"/iperf3-"$count"-error.json
                if grep -q "busy" "$work_dir"/iperf3-"$count"-error.json; then
                    sleep 0.5
                fi
                if [ -s "$work_dir"/iperf3-"$count".json ]; then
                    break
                fi
            done
            # 上传速度，Mbps
            if [ -s "$work_dir"/iperf3-"$count".json ]; then
                upload="$( awk '{ rows[NR] = $0 } END{ print rows[NR-3] }' "$work_dir"/iperf3-"$count".json | awk -F'Bytes ' '{ print $2 }' | awk '{ print $1 }' )"
                _check_num "$upload" || upload="  失败"
                _check_num "$upload" || upload_c="17"
                _check_num "$upload" && upload="$( printf "%.2f" "$upload" ) Mbps"
            else
                upload="  跳过" && upload_c="17"
            fi
            # 下载
            for (( i_busy=1; i_busy<=65; i_busy++ )); do
                iperf3 -R -f m $option_para > "$work_dir"/iperf3-"$count".json 2> "$work_dir"/iperf3-"$count"-error.json
                if grep -q "busy" "$work_dir"/iperf3-"$count"-error.json; then
                    sleep 0.5
                fi
                if [ -s "$work_dir"/iperf3-"$count".json ]; then
                    break
                fi
            done
            # 下载速度，Mbps
            if [ -s "$work_dir"/iperf3-"$count".json ]; then
                download="$(awk '{ rows[NR] = $0 } END{ print rows[NR-2] }' "$work_dir"/iperf3-"$count".json | awk -F'Bytes ' '{ print $2 }' | awk '{ print $1 }' )"
                _check_num "$download" || download="  失败"
                _check_num "$download" || download_c="17"
                _check_num "$download" && download="$( printf "%.2f" "$download" ) Mbps"
            else
                upload="  跳过" && upload_c="17"
            fi
            # 输出结果
            [ -s "$work_dir"/iperf3-"$count".json ] && _check_output
        else
        # 单向
            for (( i_busy=1; i_busy<=65; i_busy++ )); do
                iperf3 -f m $option_para > "$work_dir"/iperf3-"$count".json 2> "$work_dir"/iperf3-"$count"-error.json
                if grep -q "busy" "$work_dir"/iperf3-"$count"-error.json; then
                    sleep 0.5
                fi
                if [ -s "$work_dir"/iperf3-"$count".json ]; then
                    break
                fi
            done
            # iperf3输出
            if [ -s "$work_dir"/iperf3-"$count".json ]; then
                # 节点名称
                node_name=$( awk -F, NR=="$count"'{ print $2 }' "$work_dir"/iperf3-node.txt )
                # 延迟，ms
                latency=" 跳过"
                latency_c="15"
                # 抖动，ms
                jitter=" 跳过"
                jitter_c="15"
                # 下载、上传速度，Mbps
                upload="$( awk '{ rows[NR] = $0 } END{ print rows[NR-3] }' "$work_dir"/iperf3-"$count".json | awk -F'Bytes ' '{ print $2 }' | awk '{ print $1 }' )"
                _check_num "$upload" || upload="  失败"
                _check_num "$upload" || upload_c="17"
                _check_num "$upload" && upload="$( printf "%.2f" "$upload" ) Mbps"
                download="$(awk '{ rows[NR] = $0 } END{ print rows[NR-2] }' "$work_dir"/iperf3-"$count".json | awk -F'Bytes ' '{ print $2 }' | awk '{ print $1 }' )"
                _check_num "$download" || download="  失败"
                _check_num "$download" || download_c="17"
                _check_num "$download" && download="$( printf "%.2f" "$download" ) Mbps"
                _check_option "-R" "$option_para" && upload="  跳过"
                _check_option "-R" "$option_para" && upload_c="17"
                _check_option "-R" "$option_para" || download="  跳过"
                _check_option "-R" "$option_para" || download_c="17"
                # 输出结果
                [ -s "$work_dir"/iperf3-"$count".json ] && _check_output
            fi
        fi
        count=$(( count + 1 ))
    done < "$work_dir"/iperf3-para.txt
}


########## 整理选项、参数 ##########

# 不带参数的选项，包括-/--
_filter_option_0_para() {
    if [ "$( echo "$line_input" | awk "{ print $"$column_count" }" )" == "$1" ] || [ "$( echo "$line_input" | awk "{ print $"$column_count" }" )" == "$2" ]; then
        line_output="$line_output $1"
    fi
}

# 带一个参数的选项，包括-/--
_filter_option_1_para() {
    if [ "$( echo "$line_input" | awk "{ print $"$column_count" }" )" == "$1" ] || [ "$( echo "$line_input" | awk "{ print $"$column_count" }" )" == "$2" ]; then
        column_count=$(( column_count + 1 ))
        line_output="$line_output $1 $( echo "$line_input" | awk "{ print $"$column_count" }" )"
    fi
}

# bim-core专用，处理为链接的参数
_filter_bim_core_1() {
    if [[ "$( echo "$line_input" | awk "{ print $"$column_count" }" )" =~ http ]]; then
        line_output="$line_output $( echo "$line_input" | awk "{ print $"$column_count" }" )"
    fi
}

# speedtest-cli
_filter_option_speedtest_cli() {
    local file_input="$1"
    local file_output="$2"
    local line_input
    local line_output
    local column_count
    local column_all_count
    while IFS= read -r line_input; do
        IFS="$old_IFS"
        line_output=""
        column_all_count="$( echo "$line_input" | awk '{ print NF }' )"
        for (( column_count=1; column_count <= column_all_count; column_count++ )); do
            _filter_option_1_para -s --server-id
            _filter_option_1_para -o --host
        done
        echo "$line_output" >> "$file_output"
    done < "$file_input"
}

# bim-core
_filter_option_bim_core() {
    local file_input="$1"
    local file_output="$2"
    local line_input
    local line_output
    local column_count
    local column_all_count
    while IFS= read -r line_input; do
        IFS="$old_IFS"
        line_output=""
        column_all_count="$( echo "$line_input" | awk '{ print NF }' )"
        for (( column_count=1; column_count <= column_all_count; column_count++ )); do
            _filter_option_1_para -6 --ipv6
            _filter_option_1_para -m --multi
            _filter_bim_core_1
        done
        echo "$line_output" >> "$file_output"
    done < "$file_input"
}

# speedtest-go
_filter_option_speedtest_go() {
    local file_input="$1"
    local file_output="$2"
    local line_input
    local line_output
    local column_count
    local column_all_count
    while IFS= read -r line_input; do
        IFS="$old_IFS"
        line_output=""
        column_all_count="$( echo "$line_input" | awk '{ print NF }' )"
        for (( column_count=1; column_count <= column_all_count; column_count++ )); do
            _filter_option_1_para -s --server
            _filter_option_1_para --custom-url --custom-url
            _filter_option_1_para -t --thread
            _filter_option_0_para -m --multi
            _filter_option_0_para --no-download --no-download
            _filter_option_0_para --no-upload --no-upload
            _filter_option_0_para --force-http-ping --force-http-ping
        done
        echo "$line_output" >> "$file_output"
    done < "$file_input"
}

# librespeed-cli
_filter_option_librespeed_cli() {
    local file_input="$1"
    local file_output="$2"
    local line_input
    local line_output
    local column_count
    local column_all_count
    while IFS= read -r line_input; do
        IFS="$old_IFS"
        line_output=""
        column_all_count="$( echo "$line_input" | awk '{ print NF }' )"
        for (( column_count=1; column_count <= column_all_count; column_count++ )); do
            _filter_option_1_para --server-json --server-json
            _filter_option_1_para --local-json --local-json
            _filter_option_1_para --server --server
            _filter_option_1_para --duration --duration
            _filter_option_0_para --no-download --no-download
            _filter_option_0_para --no-upload --no-upload
            _filter_option_0_para --no-icmp --no-icmp
            _filter_option_0_para -4 --ipv4
            _filter_option_0_para -6 --ipv6
        done
        echo "$line_output" >> "$file_output"
    done < "$file_input"
}

# iperf3
_filter_option_iperf3() {
    local file_input="$1"
    local file_output="$2"
    local line_input
    local line_output
    local column_count
    local column_all_count
    while IFS= read -r line_input; do
        IFS="$old_IFS"
        line_output=""
        column_all_count="$( echo "$line_input" | awk '{ print NF }' )"
        for (( column_count=1; column_count <= column_all_count; column_count++ )); do
            _filter_option_1_para -c -c
            _filter_option_1_para -p --port
            _filter_option_1_para -P --parallel
            _filter_option_1_para -i --interval
            _filter_option_1_para -t --time
            _filter_option_1_para -O --omit
            _filter_option_0_para -R --reverse
            _filter_option_0_para -u --udp
            _filter_option_0_para -4 --version4
            _filter_option_0_para -6 --version6
        done
        echo "$line_output" >> "$file_output"
    done < "$file_input"
}


########## 检测选项，用于预判测速结果 ##########

_check_option() {
    local option_input="$1"
    local options_input="$2"
    if echo "$options_input" | grep -q -- "$option_input"; then
        return 0
    else
        return 1
    fi
}


_check_num() {
    local num_input=$1
    if [[ "$num_input" =~ ^[0-9]+(\.[0-9]+)?$ ]] && ! [[ "$num_input" =~ ^0+(\.0+)?$ ]]; then
        return 0
    else
        return 1
    fi
}


########## 输出 ##########

_check_output(){
    local count_check_output=0
    local i_check_output
    for i_check_output in $( echo "$download $upload $latency $jitter" ); do
        if [[ "$i_check_output" =~ 失败 ]]; then
            count_check_output=$(( count_check_output + 1 ))
        elif [[ "$i_check_output" =~ 跳过 ]]; then
            count_check_output=$(( count_check_output + 1 ))
        fi
    done
    [ "$count_check_output" -ne 4 ] && printf "${yellow}%-s${green}%-${download_c}s${cyan}%-${upload_c}s${blue}%-${latency_c}s${purple}%-${jitter_c}s${endc}\n" "$node_name" "$download" "$upload" "$latency" "$jitter"
}


########## 删除残余文件 ##########

_rm_dir() {
    rm -rf "$work_dir"
}

########## main ##########

_main() {
    _check_architecture
    _constant
    _print_banner_1
    _check_region
    _check_package tar tar
    _check_package curl curl
    _check_package iperf3 iperf3
    _check_package bc bc
    _make_dir
    _download_tar
    _check_tar_sha256
    _unzip_tar
    clear
    _get_node_list
    _classify_node
    clear
    _print_banner_1
    [ -s "$work_dir"/banner-custom.txt ] && _print_banner_2
    _print_banner_3
    [ -s "$work_dir"/speedtest-cli-node.txt ] && _speedtest_cli_test
    [ -s "$work_dir"/bim-core-node.txt ] && _bim_core_test
    [ -s "$work_dir"/speedtest-go-node.txt ] && _speedtest_go_test
    [ -s "$work_dir"/librespeed-cli-node.txt ] && _librespeed_cli_test
    [ -s "$work_dir"/iperf3-node.txt ] && _iperf3_test
    _print_banner_4
    _rm_dir
}


####################

_main
