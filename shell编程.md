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

   ​