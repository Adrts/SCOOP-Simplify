## SCOOP修改版（精简过）

添加了国内加速链接加速github和sourceforge的功能。

这两个平台的软件占了SCOOP的大部分了。应该够用。

还对bucket采用浅克隆，可以省下不少空间。

使用方法
```
# Example:
#   scoop config github_mirror_url https://xxxxxx
#   scoop config sourceforge_mirror_url https://xxxxxx
```

添加完加速链接后会自动用加速链接来下载，没有修改别的地方。

安装原版想换到这个版本可以
```
scoop config SCOOP_REPO https://github.com/Adrts/SCOOP-Simplify
scoop config SCOOP_BRANCH main
scoop update
```
我也不知道为什么会有这个版本，总之，重建了git仓库，删了一些编辑器相关不影响运行的东西，省下了大概15MB的空间。
