#!/bin/bash

##############配置下面两行即可

SERVERS="cj01 cj02 cj03 cj04 cj05" ######服务器
PASSWORD=686391                    ######密码

auto_ssh_copy_id() {
    expect -c "set timeout -1;
        spawn ssh-copy-id $1;
        expect {
            *(yes/no)* {send -- yes\r;exp_continue;}      ##############输入yes
            *assword:* {send -- $2\r;exp_continue;}      ###############输入密码
            eof        {exit 0;}
        }";
}

ssh_copy_id_to_all() {
    for SERVER in $SERVERS
    do
        auto_ssh_copy_id $SERVER $PASSWORD
    done
}

ssh_copy_id_to_all
