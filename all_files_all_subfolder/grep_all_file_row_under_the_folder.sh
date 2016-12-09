#!/bin/bash
###############################################################################
#    文件名  :    grep_all_file_row_under_the_folder.sh                      
#    功  能  :    遍历文件夹中的文件，查找文件每行的字符串                      
#    编  写  :    clark.xu                                                   
#    修  改  :                                                               
#    时  间  :    2016-12-09                                                  
#    版  权  :    v0.1                                                       
#    执  行  :   grep_all_file_row_under_the_folder.sh 目录名称 
###############################################################################
### 关于shell的参数
#    $0 ： grep_all_file_row_under_the_folder.sh即命令本身，相当于c/c++中的argv[0]
#    $1 ： -f,第一个参数.
#    $2，$3, $4 ... ：类推。
#    $#  参数的个数，不包括命令本身
#    $@ ：参数本身的列表，也不包括命令本身
#    $* ：和$@相同，但"$*" 和 "$@"(加引号)并不同，"$*"将所有的参数解释成一个字符串，而"$@"是一个参数数组。                                                            #
###############################################################################

echo "######" > 1.txt
for file in `ls &1`
do
        echo $file >> 1.txt
        echo "######################\n" >> 1.txt
        file="BDW_ADL/"$file
        cat $file | while read oneline
        do
             result=`echo $oneline | grep -i FDL_T01_ALL_USER_IDENTIFICATION`
             echo $result>>1.txt
        done
done
############################################################
##去掉空行
##grep -v "^$" 1.txt
##cat 1.txt |sed '/^$/d'
##cat 1.txt |tr -s '\n'
############################################################
cat 1.txt |tr -s '\n' > 2.txt
