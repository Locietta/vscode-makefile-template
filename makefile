# Simple handwritten Makefile for practice @Locietta

vpath %.h ./include 
vpath %.hpp ./include 
vpath %.cpp ./src 
vpath %.c ./src 

##################################################

# 主文件和生成的可执行文件名称
BIN      = main
# 源文件列表，主文件和src文件夹下所有的.cpp文件
SRC      = $(BIN).cpp $(wildcard ./src/*.cpp)
# 目标文件列表，源文件列表的.cpp后缀换成.o
OBJ      = $(patsubst %.cpp, %.o, $(SRC))

##################################################

# 链接器和C编译器 # Linker & C compiler
CC       = g++
# C++编译器      # C++ compiler
CXX      = g++
# 额外的头文件包含路径 `-I"<头文件所在的路径>"`
INCS     = -I"./include"
# 链接选项
LDFLAGS  = -static-libgcc
# C编译选项
CFLAGS = $(INCS) -Werror -O2 -DNDEBUG
# C++编译选项
CXXFLAGS = $(INCS) -Werror -O2 -DNDEBUG

# 为debug目标指定不同的C/C++编译选项
debug: CXXFLAGS = $(INCS) -Wall -Wextra -O0 -g

debug: CFLAGS = $(INCS) -Wall -Wextra -O0 -g

##################################################

# don't touch here, unless you really know what you're doing

.PHONY: release debug clean cb_gen

debug: $(BIN) # default target

$(BIN): $(OBJ)

release: $(BIN) 

# don't use it if you don't know clangd or LSP
cb_gen: # generate compile database for clangd, you may need `pip install compiledb`
	@compiledb -n make debug -j8
	@mkdir -p build && mv compile_commands.json build/

clean:
	${RM} $(OBJ) $(BIN)