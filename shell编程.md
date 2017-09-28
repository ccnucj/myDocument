## shell编程

1. for循环

   ```
   1. for N in 1 2 3
      do 
        echo $N
      done
   2. for N in 1 2 3;do echo $N;done
   3. for ((i=0;i<=5;i++));do echo "welcome $i times";done     
      #######for后面必须有空格，括号中可以没有空格
   4. for (i=2;i<=10;i++)
       do
         echo "welcome $i times"
       done
   ```

2. while

   ```
   1. ##############[]前后必须有空格，比较符号前后必须有空格
       while [ 2 > 0 ]
       do 
         echo '2>0 是对的'
       done
   2. ###############双括号中可以没有空格
      while ((2>0))
      do
      echo '2>0'
      done	 
   3. while ((2>0));do echo '2>0';done     ##############用分号隔断命令
   4. i=1;while ((i<=10));do let i++;echo $i;done    ###############let的用法
   ```

3. case的用法

   ```
   case $1 in
   start)                           #####注意是单右括号
        echo 'starting'
        ;;                          #####注意是两个分号
   stop)
        echo 'stoping'
        ;;
   *)                               #####类似于java中的default
        echo 'Usage:{start|stop}'   
   esac                             #####结束符是esac
   ```

4. read接收参数

   ```
   read -p 'please input your name : ' name    ######用name变量接收用户的输入
   ```

5. if的用法

   ```
   read -p 'please input your name : ' name   ####read后面用name接收参数
   echo $name

   if [ $name = root ]                        ####[]前后必须有空格，=前后必须有空格
     then echo "hello $name, welcome !"       ####如果符合条件，则用then表示动作开始
     elif [ $name = chenjie ]                 ####elif  类似与java中的else if
       then                              
         echo "hello $name, welcome !"
     else                                     #####else
       echo "SB,get out here"
   fi                                         #####fi表示if结束
   ```

6. $?  接收返回值

   ```
   ############## 0 为 true, 1 为false
   [ 2 > 0 ]
   A=$?
   echo $A               ##########输出0

   ###############我是分割线####################################

   [  ]
   A=$?
   echo $A               ###########输出1
   ```

7. 类似三元运算符

   ```
   [ condition ]&&echo ok||echo notok        #####condition为true 输出ok,否则输出notok
   ```

8. 常用判断条件

   ```
   =     ###字符串比较，数值不能用这个比较
   -lt   ###小于
   -le   ###小于等于
   -ge   ###大于等于
   -gt   ###大于
   -eq   ###等于
   -ne   ###不等于

   #################文件的判断#######################
   -r 有读的权限
   -w 有写的权限
   -x 有执行的权限
   -f 文件存在并且是一个常规的文件
   -s 文件存在且不为空
   -d 文件存在并是一个目录
   -b 文件存在并且是一个块设备
   -L 文件存在并且是一个链接
   ```

9. 函数的声明和调用

   ```
   #########函数必须先声明后调用，调用时直接写名字，不用（）
   function echo1()
   {
     echo 'this is function echo1'
   }
   echo1           ###调用函数

   ########函数返回值
   函数返回值，只能通过$? 系统变量获得，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。 return后跟数值n(0-255)
   ```

10. 脚本调试

    ```
    ###脚本function.sh
    #!/bin/bash
    function echo1()
    {
      echo 'this is function echo1'
    }
    echo1
    echo $?

    ###脚本调试
    sh -vx function.sh

    ###输出的信息
    [chenjie@cj01 ~]$ sh -vx function.sh 
    #!/bin/bash
    function echo1()
    {
      echo 'this is function echo1'
    }
    echo1
    + echo1
    + echo 'this is function echo1'
    this is function echo1
    echo $?
    + echo 0
    0
    ```

    ​

    ​