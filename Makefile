
CC=gcc
CPPFLAGS=-I./include 
CFLAGS=-Wall 


#找到当前目录下所有的.c文件
src = $(wildcard *.c)

#将当前目录下所有的.c  转换成.o给obj
obj = $(patsubst %.c, %.o, $(src))


test_fdfs_client=./test/fdfs_client_test
main=main_test

target=$(test_fdfs_client)$(main)


ALL:$(target)


#生成所有的.o文件
$(obj):%.o:%.c
	$(CC) -c $< -o $@ $(CPPFLAGS) $(CFLAGS) 


$(test_fdfs_client):./test/fdfs_client_test.o make_log.o
	$(CC) $^ -o $@
$(main):main.o make_log.o
	$(CC) $^ -o $@


#clean指令

clean:
	-rm -rf $(obj) $(target) ./test/*.o

distclean:
	-rm -rf $(obj) $(target) ./test/*.o

#将clean目标 改成一个虚拟符号
.PHONY: clean ALL distclean
