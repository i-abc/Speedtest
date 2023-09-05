# 多功能测速脚本

兼容 [speedtest-cli](https://www.speedtest.net/zh-Hans/apps/cli)、[speedtest-go](https://github.com/showwin/speedtest-go)、[librespeed-cli](https://github.com/librespeed/speedtest-cli)、[iperf3](https://github.com/esnet/iperf)，脚本自带丰富的测试项目任君挑选，使用者还能自定义想要的测试项目。

## 使用方法

```bash
bash <(curl -sL bash.icu/speedtest)
```

或

```bash
bash <(curl -sL https://raw.githubusercontent.com/i-abc/Speedtest/main/speedtest.sh)
```

## 基本功能

脚本自带丰富的测试项目

0. 自定义测速节点
1.  大陆三网+教育网 多线程 IPv4
2.  大陆三网 单线程 IPv4
3.  大陆教育网 IPv6
4.  IPV4 UDP 可用测试
5.  各大洲 128线程 IPV4
6.  大陆教育网 IPv4
7.  大陆电信 多线程 IPv4
8.  大陆电信 单线程 IPv4
9.  大陆移动 多线程 IPv4
10. 大陆移动 单线程 IPv4
11. 大陆联通 多线程 IPv4
12. 大陆联通 单线程 IPv4
13. 各大洲 单线程 IPV4
14. 各大洲 八线程 IPV4
持续更新中……

- 大陆三网+教育网 多线程 IPv4

测试机：Azure 东京

```
------------------------ 多功能 自更新 测速脚本 ------------------------
 Version               : v2023-09-04
 Usage                 : bash <(curl -sL bash.icu/speedtest)
 GitHub                : https://github.com/i-abc/speedtest
------------------------------------------------------------------------
大陆三网+教育网 IPv4 多线程测速，v2023-09-04
------------------------------------------------------------------------
测速节点            下载/Mbps      上传/Mbps      延迟/ms      抖动/ms
电信 天津           4764.75 Mbps   960.30 Mbps    51.86 ms     0.13 ms
电信 甘肃兰州       4136.04 Mbps   958.73 Mbps    63.29 ms     0.31 ms
电信 四川成都       16.05 Mbps     459.07 Mbps    80.58 ms     2.31 ms
电信 安徽合肥 5G    2291.84 Mbps   957.71 Mbps    37.99 ms     0.08 ms
电信 浙江宁波 5G    1935.21 Mbps   960.06 Mbps    44.47 ms     1.88 ms
电信 江苏镇江 5G    6439.96 Mbps   960.21 Mbps    40.92 ms     0.39 ms
电信 江苏连云港 5G  5790.42 Mbps   365.68 Mbps    37.26 ms     0.17 ms
移动 北京           2295.33 Mbps   953.58 Mbps    119.86 ms    0.13 ms
移动 四川成都       1916.11 Mbps   960.06 Mbps    132.76 ms    0.42 ms
移动 浙江杭州 5G    2427.86 Mbps   719.87 Mbps    85.94 ms     0.30 ms
移动 陕西西安 5G    3028.91 Mbps   502.53 Mbps    108.21 ms    0.17 ms
联通 江苏无锡       2247.38 Mbps   779.37 Mbps    38.67 ms     1.44 ms
联通 四川成都       30.51 Mbps     31.06 Mbps     70.53 ms     0.24 ms
联通 福建福州       4237.51 Mbps     失败         53.61 ms     0.18 ms
联通 辽宁沈阳       1761.79 Mbps   280.18 Mbps    71.07 ms     0.92 ms
联通 海南三亚       4440.05 Mbps   957.89 Mbps    73.55 ms     0.17 ms
联通 湖南长沙 5G    16.88 Mbps     945.14 Mbps    50.58 ms     0.94 ms
联通 河南郑州 5G    2211.21 Mbps   960.74 Mbps    74.24 ms     0.10 ms
教育网 江苏南京     638.73 Mbps    516.97 Mbps    829.45 ms    886.87 ms
教育网 安徽合肥     0.00 Mbps      510.21 Mbps    106.45 ms    0.81 ms
------------------------------------------------------------------------
当前时间：2023-09-05 19:26:29 CST
北京时间: 2023-09-05 19:26:29+08:00
------------------------------------------------------------------------
```

- 大陆三网 单线程 IPv4

测试机：Azure 东京

```
------------------------ 多功能 自更新 测速脚本 ------------------------
 Version               : v2023-09-04
 Usage                 : bash <(curl -sL bash.icu/speedtest)
 GitHub                : https://github.com/i-abc/speedtest
------------------------------------------------------------------------
大陆三网 IPv4 单线程测速，v2023-09-04
------------------------------------------------------------------------
测速节点            下载/Mbps      上传/Mbps      延迟/ms      抖动/ms
电信 天津           193.86 Mbps    8.00 Mbps      95.13 ms     35.74 ms
电信 甘肃兰州       14.87 Mbps     8.00 Mbps      151.97 ms    153.26 ms
电信 四川成都       4.39 Mbps      1.65 Mbps      728.97 ms    554.91 ms
电信 安徽合肥 5G    184.33 Mbps    10.47 Mbps     81.30 ms     29.51 ms
电信 浙江宁波 5G    220.87 Mbps    13.59 Mbps     316.42 ms    638.03 ms
电信 江苏镇江 5G    184.33 Mbps    15.32 Mbps     106.56 ms    149.46 ms
电信 江苏连云港 5G  220.87 Mbps    17.11 Mbps     58.36 ms     12.69 ms
移动 北京           69.92 Mbps     6.48 Mbps      200.34 ms    93.52 ms
移动 四川成都       57.20 Mbps     5.73 Mbps      153.29 ms    23.36 ms
移动 浙江杭州 5G    96.93 Mbps     9.60 Mbps      125.33 ms    32.49 ms
移动 陕西西安 5G    85.81 Mbps     6.48 Mbps      151.17 ms    47.80 ms
联通 四川成都       5.00 Mbps      5.60 Mbps      108.50 ms    43.12 ms
联通 福建福州       137.39 Mbps    11.33 Mbps     100.20 ms    47.38 ms
联通 辽宁沈阳       8.10 Mbps      6.48 Mbps      247.68 ms    83.61 ms
联通 海南三亚       116.00 Mbps    8.87 Mbps      117.02 ms    39.37 ms
联通 湖南长沙 5G    1.66 Mbps      8.07 Mbps      434.11 ms    237.42 ms
联通 河南郑州 5G    21.08 Mbps     11.19 Mbps     100.63 ms    35.38 ms
联通/电信 宿迁 自建   跳过         345.00 Mbps     跳过         跳过
------------------------------------------------------------------------
当前时间：2023-09-05 19:35:25 CST
北京时间: 2023-09-05 19:35:25+08:00
------------------------------------------------------------------------
```

- 各大洲 128线程 IPV4

测试机：DigitalOcean 旧金山

```
------------------------ 多功能 自更新 测速脚本 ------------------------
 Version               : v2023-09-04
 Usage                 : bash <(curl -sL bash.icu/speedtest)
 GitHub                : https://github.com/i-abc/speedtest
------------------------------------------------------------------------
大洲 IPv4 一百二十八线程测速，v2023-09-04
------------------------------------------------------------------------
测速节点            下载/Mbps      上传/Mbps      延迟/ms      抖动/ms
美国 阿什本         7434.00 Mbps   1983.00 Mbps    跳过         跳过
美国 亚特兰大       1924.00 Mbps     失败          跳过         跳过
美国 查尔斯顿       8999.00 Mbps   1882.00 Mbps    跳过         跳过
亚洲 乌兹别克斯坦   3111.00 Mbps     失败          跳过         跳过
欧洲 柏林           5028.00 Mbps   1894.00 Mbps    跳过         跳过
欧洲 哥本哈根       3479.00 Mbps   1245.00 Mbps    跳过         跳过
欧洲 阿姆斯特丹     7379.00 Mbps   1632.00 Mbps    跳过         跳过
非洲 毛里求斯       3890.00 Mbps   1570.00 Mbps    跳过         跳过
大洋洲 新西兰       3672.00 Mbps     失败          跳过         跳过
------------------------------------------------------------------------
当前时间：2023-09-05 11:26:30 UTC
北京时间: 2023-09-05 19:26:30+08:00
------------------------------------------------------------------------
```

- IPV4 UDP 可用测试

测试机：Azure 东京

```
------------------------ 多功能 自更新 测速脚本 ------------------------
 Version               : v2023-09-04
 Usage                 : bash <(curl -sL bash.icu/speedtest)
 GitHub                : https://github.com/i-abc/speedtest
------------------------------------------------------------------------
UDP IPv4 单线程测速，v2023-09-04
机房UDP限速，结果仅代表UDP是否可用
------------------------------------------------------------------------
测速节点            下载/Mbps      上传/Mbps      延迟/ms      抖动/ms
联通/电信 宿迁 自建 1.05 Mbps      1.05 Mbps       跳过         跳过        
美国 阿什本         1.05 Mbps      1.05 Mbps       跳过         跳过        
美国 亚特兰大       1.05 Mbps      1.05 Mbps       跳过         跳过        
美国 查尔斯顿       1.04 Mbps      1.05 Mbps       跳过         跳过        
------------------------------------------------------------------------
当前时间：2023-09-05 20:19:26 CST
北京时间: 2023-09-05 20:19:26+08:00
------------------------------------------------------------------------
```

## 高级功能

自定义自己想要的测试项目，很简单的。

我们会有两张表，节点表 (必需)、节点集合表 (非必需)

### 节点表 (必需)

节点表分为四个区域，分别是提示语区、测试类型区、节点名区、测试参数区，如下图所示：

![](https://github.com/i-abc/Speedtest/raw/main/images/1.png)

- 示例

```
节点表 模板示例，v2023-09-05
speedtest-cli ,联通 郑州 cli       ,-o 5gtest.shangdu.com
speedtest-go  ,联通 郑州 go        ,--custom-url http://5gtest.shangdu.com:8080/speedtest/upload.php --force-http-ping
speedtest-go  ,联通 郑州 八线程    ,--custom-url http://5gtest.shangdu.com:8080/speedtest/upload.php --force-http-ping -t 8
speedtest-go  ,联通 郑州 只测上传  ,--custom-url http://5gtest.shangdu.com:8080/speedtest/upload.php --force-http-ping --no-download
librespeed-cli,教育 南京           ,--server-json https://jihulab.com/i-abc/speedtest/-/raw/node/china-education.json --server 1 --no-icmp
librespeed-cli,教育 南京 只测上传  ,--server-json https://jihulab.com/i-abc/speedtest/-/raw/node/china-education.json --server 1 --no-icmp --no-download
iperf3        ,联通 宿迁 只测上传  ,-c 103.239.244.210 -p 22222
iperf3        ,联通 宿迁 只测下载  ,-c 103.239.244.210 -p 22222 -R
iperf3        ,联通 宿迁 八线程    ,-c 103.239.244.210 -p 22222 -P 8
iperf3        ,联通 宿迁 测UDP     ,-c 103.239.244.210 -p 22222 -u
iperf3        ,联通 宿迁 测双向    ,-c 103.239.244.210 -p 22222 --up-and-down
```

- 1区：提示语区 (可选)

提示语位于节点表开头，可以在这里写上任何话，比如使用说明、备注、自家广告等，当然也可以不写。

- 3区：节点名区

显而易见，这里就是写对应节点的名字。

由于中英文字符编码很难处理，所以如果想要输出美观还得麻烦大家敲空格对齐，当然不对齐对测试无影响。

提示语区、节点名区会直接反映到输出，它们在输出、节点表之间的关系如下图所示：

![](https://github.com/i-abc/Speedtest/raw/main/images/2.png)

- 2区：测试类型区

我们有四种类型，分别是 [speedtest-cli](https://www.speedtest.net/zh-Hans/apps/cli)、[speedtest-go](https://github.com/showwin/speedtest-go)、[librespeed-cli](https://github.com/librespeed/speedtest-cli)、[iperf3](https://github.com/esnet/iperf)，选一种即可，每种都有不同的特点，具体说明请往下看。

这部分加空格对齐不是必须的，不加对输出无任何影响，当然像我一样的强迫症可以加空格对齐。

- 4区：测试参数区

我们脚本兼容 [speedtest-cli](https://www.speedtest.net/zh-Hans/apps/cli)、[speedtest-go](https://github.com/showwin/speedtest-go)、[librespeed-cli](https://github.com/ librespeed/speedtest-cli)、[iperf3](https://github.com/esnet/iperf)，我挑选了部分对测试有用的参数应用到了脚本里，大家可以按需使用。

1. speedtest-cli

[speedtest-cli](https://www.speedtest.net/zh-Hans/apps/cli)

[speedtest.net](https://www.speedtest.net) 官方 CLI，功能单一。

 | 参数 | 作用         | 示例                    |
|----|------------|-----------------------|
| -s value | 通过 id 指定节点 | -s 36646              |
| -o value | 通过域名指定节点   | -o 5gtest.shangdu.com |

`-s` 和 `-o` 二选一，`-o` 后面参数为纯域名，不含 http(s)、端口号。

节点 id、域名可在 [https://www.speedtest.net/api/ios-config.php](https://www.speedtest.net/api/ios-config.php) 查阅。

例如：`<server url="http://5gtest.shangdu.com:8080/speedtest/upload.php" lat="34.3287" lon="109.0337" name="Zhengzhou" sponsor="China Unicom HeNan 5G" id="36646"/>`，则 id 为 `36646`，域名为 `5gtest.shangdu.com`。

2. speedtest-go

[speedtest-go](https://github.com/showwin/speedtest-go)

针对 [speedtest.net](https://www.speedtest.net) 开发的，功能较多，能实现指定线程、禁用某方向测速，但当服务器与测速节点相距较远时结果不如 [speedtest.net](https://www.speedtest.net) 官方 CLI。

| 参数                | 作用                         | 示例                                                               |
|-------------------|----------------------------|------------------------------------------------------------------|
| -s value        | 通过 id 指定节点           | -s 36646                                                         |
| --custom-url value | 通过链接指定节点              | --custom-url http://5gtest.shangdu.com:8080/speedtest/upload.php |
| -t value          | 设置并发连接数                   | -t 8                                                             |
| -m                | 启用多服务器模式                   | -m                                                               |
| --no-download     | 禁用下载测试                     | --no-download                                                    |
| --no-upload       | 禁用上传测试                     | --no-upload                                                      |
| --force-http-ping | 使用 HTTP 进行强制 Ping，而不是 ICMP | --force-http-ping                                                |

`-s` 和 `--custom-url` 二选一，`--custom-url` 后面参数为完整链接。

`--force-http-ping` 推荐加上。

节点 id、链接可在 [https://www.speedtest.net/api/ios-config.php](https://www.speedtest.net/api/ios-config.php) 查阅。

例如：`<server url="http://5gtest.shangdu.com:8080/speedtest/upload.php" lat="34.3287" lon="109.0337" name="Zhengzhou" sponsor="China Unicom HeNan 5G" id="36646"/>`，则 id 为 `36646`，链接为 `http://5gtest.shangdu.com:8080/speedtest/upload.php`。

3. librespeed-cli

[librespeed-cli](https://github.com/librespeed/speedtest-cli)

| 参数            | 作用                                            | 示例                                                                                |
|---------------|-----------------------------------------------|-----------------------------------------------------------------------------------|
| --server-json | 远程 JSON 的服务端列表                                | --server-json https://jihulab.com/i-abc/speedtest/-/raw/node/china-education.json |
| --local-json  | 本地 JSON 的服务端列表                                | --local-json /root/librespeed.json                                                |
| --server      | 通过 JSON 中的 ID 指定服务端                           | --server 1                                                                        |
| -4            | 仅使用 IPv4 (默认 false)                           | -4                                                                                |
| -6            | 仅使用 IPv6 (默认 false)                           | -6                                                                                |
| --no-download | 禁用下载测试 (默认 false)                             | --no-download                                                                     |
| --no-upload   | 禁用上传测试 (默认 false)                             | --no-upload                                                                       |
| --no-icmp     | 不使用 ICMP Ping。ICMP 在 Linux 下工作不稳定 (默认 false) | --no-icmp                                                                         |
| --duration    | 测试的持续时间 (秒) (默认 15)                          | --duration 20                                                                     |

`--no-icmp` 推荐加上。

现成的、优质的 librespeed 服务端较少，而且需要自己写服务端列表 JSON，JSON 写法参照 [官方](https://github.com/librespeed/speedtest-cli#use-a-custom-backend-server-list)；如果是个人搭建测速、个人使用，推荐 iperf3.

4. iperf3

[iperf3](https://github.com/esnet/iperf)

| 参数            | 作用                  | 示例                 |
|---------------|---------------------|--------------------|
| -c ip/host    | 指定服务端               | -c 103.239.244.210 |
| -p value      | 指定服务端端口             | -p 22222           |
| -P value      | 设置并发连接数             | -P 8               |
| -t value      | 测试的持续时间 (秒) (默认 10) | -t 20              |
| -O value      | 前 N 秒的数据不计入最终结果     | -O 3               |
| -R            | 反向模式，服务器发送、客户端接收    | -R                 |
| -4            | 仅使用 IPv4            | -4                 |
| -6            | 仅使用 IPv6            | -6                 |
| -u            | UDP测试               | -u                 |
| --up-and-down | 双向测试 (自创选项)       | --up-and-down      |

当服务端端口为默认的 5201 时，`-p` 可不加；`-p` 除了 `-p 22222` 指定一个端口，还能 `-p 5200-5209` 指定一个范围内的端口。

iperf3 默认是客户端发送、服务端接收，也就是测上传；想测下载可加 `-R` 开启反向模式；但 iperf3 只支持单向，所以脚本里自创了 `--up-and-down` 选项，加上后可测双向；`--up-and-down` 与 `-R` 二选一，且 `--up-and-down` 在本脚本以外的地方不可用，非官方选项。

现成的、优质的 iperf3 服务端很多，可在 [iPerf3 Server List](https://iperf3serverlist.net) 查阅；自建 iperf3 服务端也简单，用包管理器就行了。

### 节点集合表 (非必需)

当你有很多节点表时可以组一个节点表合集，如下图所示，当然这不是必需的。

![](https://github.com/i-abc/Speedtest/raw/main/images/3.png)

- 示例

```
1. 节点示例
/root/GitHub/speedtest/node-template-1.txt
2. 示例1
/root/GitHub/speedtest/node-template-01.txt
3. 示例2
/root/GitHub/speedtest/node-template-02.txt
```

每两行为一组，每组中的第一行以序号加英文点 `.` 开头，第二行为节点表链接，链接可为远程 http 或本地绝对路径。

节点集合表与输出之间的关系如下图所示：

![](https://github.com/i-abc/Speedtest/raw/main/images/5.png)

### 使用自定义的表

我们现在有了节点表、节点集合表，那么该如何使用呢？

只需选择时输入序号 `0`，然后填写链接或本地绝对路径即可；链接为节点表就立即开始测试，链接为节点集合表就还会出现选择节点的提示。

![](https://github.com/i-abc/Speedtest/raw/main/images/6.png)
