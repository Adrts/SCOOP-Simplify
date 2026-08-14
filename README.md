# SCOOP 修改版（精简过）

原项目地址：[https://github.com/ScoopInstaller/Scoop](https://github.com/ScoopInstaller/Scoop)

## 简介

本版本添加了国内加速链接，用于加速 GitHub 和 SourceForge 平台的下载。这两个平台的软件占了 Scoop 仓库的大部分，基本够用。同时对 bucket 采用浅克隆（`--depth 1`），可以节省不少磁盘空间。

重建了git仓库所以原项目的提交看不到了。

## 特性

- 支持配置 `github_mirror_url` 和 `sourceforge_mirror_url`，自动替换下载链接。
- 对 bucket 进行浅克隆，减少占用。

## 使用方法

### 配置加速链接

```bash
scoop config github_mirror_url https://xxxxxx
scoop config sourceforge_mirror_url https://xxxxxx
