#! /bin/bash 

# $1 表示第一个参数 如： ./gzip.sh monitor 中的 monitor
if [ -z $1 ];then
  # 打印打包文件介绍
  echo -e "打包后的文件名为 \033[34m\${项目名}_\${打包时间}\033[0m 打包时间将自动生成\n"
  # 打印获取项目名称需要
  echo -n -e "请输入项目名称，例如 \033[34mmonitor\033[0m: "
  # 获取输入内容 并判断是否输入
  if read -t 30 PROJECT; then
    echo "PROJECT name is $PROJECT"
  else
    exit 0 
  fi 
else 
  PROJECT=$1
fi
# 获取当天时间
DATE="`date +%Y%m%d`"
# 设置压缩文件名字
FILENAME="${PROJECT}_${DATE}.zip"

# 删除本地所有压缩文件
if [ -f *.zip ];then
  echo 'remove gz';
  rm -rf *.zip;
fi

# 如果有 dist 文件夹，则压缩它
if [ ! -d "./dist" ];then
  echo 'dist is nothingness';
else
  tar -zcvf $FILENAME dist;
fi
