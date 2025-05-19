#!/usr/bin/env bash

# 显示标题（蓝色）
echo -e "\033[34m--------------------------------wsgi process--------------------------------\033[0m"

# 查找与 nb_uwsgi.ini 相关的进程
ps -ef | grep nb_uwsgi.ini | grep -v grep

# 短暂停顿
sleep 0.5

# 提示即将关闭进程
echo -e '\n----------------------------------going to close----------------------------------'

# 强制终止与 nb_uwsgi.ini 相关的进程
ps -ef | grep nb_uwsgi.ini | grep -v grep | awk '{print $2}' | xargs kill -9

# 再次短暂停顿
sleep 0.5

# 提示检查终止操作
echo -e '\n----------------------------------check if the kill action is correct----------------------------------'

# 启动新的 uWSGI 进程
/envs/nb/bin/uwsgi --ini nb_uwsgi.ini & > /dev/null

# 显示启动成功信息（绿色背景）
echo -e '\n\033[42;1m----------------------------------started----------------------------------\033[0m'

# 再次暂停并检查进程
sleep 1
ps -ef | grep nb_uwsgi.ini | grep -v grep