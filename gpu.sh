# #!/bin/bash

# # 使用nvidia-smi获取GPU进程，忽略不包含PID的行
# gpu_procs=$(nvidia-smi | grep 'C\+\+' | awk '{print $5}')

# # 打印标题
# echo -e "GPU\tPID\t\tUSER\tMEMORY\tCOMMAND"

# # 遍历每个进程ID
# for pid in $gpu_procs; do
#   # 使用ps获取用户和命令
#   user=$(ps -o user= -p $pid 2>/dev/null)
#   cmd=$(ps -o cmd= -p $pid 2>/dev/null)
#   mem=$(nvidia-smi | grep $pid | awk '{print $8}')
#   gpu=$(nvidia-smi | grep $pid | awk '{print $2}')
  
#   # 如果用户信息存在，则打印出来
#   if [ -n "$user" ]; then
#     echo -e "${gpu}\t${pid}\t${user}\t\t${mem}\t${cmd}"
#   fi
# done


#!/bin/bash

# 使用nvidia-smi获取GPU进程，忽略不包含PID的行
gpu_procs=$(nvidia-smi | grep 'C\+\+' | awk '{print $5}')

# 打印标题
echo -e "GPU\tPID\tUSER\tMEMORY\tSTARTED\t\t\tCOMMAND"

# 遍历每个进程ID
for pid in $gpu_procs; do
  # 使用ps获取用户、命令和启动时间
  user=$(ps -o user= -p $pid 2>/dev/null)
  cmd=$(ps -o cmd= -p $pid 2>/dev/null)
  lstart=$(ps -o lstart= -p $pid 2>/dev/null)
  mem=$(nvidia-smi | grep $pid | awk '{print $8}')
  gpu=$(nvidia-smi | grep $pid | awk '{print $2}')
  
  # 如果用户信息存在，则打印出来
  if [ -n "$user" ]; then
    echo -e "${gpu} ${pid} ${user} ${mem} ${lstart} ${cmd}"
  fi
done