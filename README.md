# VSCode Makefile Template 

A simple C++ Multi-file VSCode project template based on Makefile.

一个基于Makefile的简易C++多文件VSCode工程模板。

## 文件结构 File Structure

主代码文件为`main.cpp`，其他的头文件和源代码文件放在include和src文件夹下

生成的可执行文件名称和主代码文件相同，和主代码文件在同一个目录。

在include和src添加文件**不需要**对Makefile做任何修改

**注意**：这是个C++模板，默认不编译.c文件。如果需要纯C工程模板，将Makefile中`SRC`和`OBJ`变量里的`.cpp`替换为`.c`即可

## 使用 Usage

**mingw项目中的make叫做`mingw32-make`，需要复制一份重命名为`make`**

* 在主文件`main.cpp`使用code-runner可以直接编译运行
* 按F5可以Debug（注意要选择make.exe的调试）
* 如果需要修改主文件名称，则应修改Makefile的`BIN`变量和launch.json中的`program`字段
* 如果使用**Clangd**，那么`make cb_gen`可以生成`compile_commands.json`