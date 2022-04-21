# Q# 開発パイロットプロジェクト

- [Q# コマンドライン操作](https://docs.microsoft.com/ja-jp/azure/quantum/how-to-command-line-local?tabs=tabid-cmdline)
- [Q# プログラミング言語ユーザー ガイド](https://docs.microsoft.com/ja-jp/azure/quantum/user-guide/)
- [Q# プログラムを実行する方法](https://docs.microsoft.com/ja-jp/azure/quantum/user-guide/host-programs?tabs=tabid-python)
- [Q# 標準ライブラリ](https://docs.microsoft.com/en-us/azure/quantum/user-guide/libraries/standard/)

## ディレクトリ構成

```bash
/                       
┣ docker/               # 環境イメージディレクトリ
┃   ┗ Dockerfile        # qサービスのイメージファイル
┣ src/                  # Q#言語
┃   ┗ ...               
┣ .editorconfig         # 
┣ .gitignore            # 
┣ docker-compose.yml    # 
┗ README.md             # 
```

## 環境準備

 - Docker
 - docker-compose

## 環境作成

```bash
# コンテナの起動
> docker-compose up -d
# bash操作
> docker-compose exec q /bin/bash
...:/app$ 
```

## 使用方法

```bash
# templateからプロジェクトを作成
...:/app$ dotnet new <Template Name or Short Name> -lang Q# -o <project name>

# プロジェクトを実行
...:/app$ dotnet run --project <project name>

# Q#のtemplate一覧
...:/app$  dotnet new -i Microsoft.Quantum.ProjectTemplates -n console
...
Template Name                  Short Name     Language  Tags
-----------------------------  -------------  --------  --------------
Class library                  classlib       Q#        Common/Library
Console Application            console        Q#        Common/Console
Quantum Application Honeywell  azq-honeywell  Q#        Common/Console
Quantum Application IonQ       azq-ionq       Q#        Common/Console
xUnit Test Project             xunit          Q#        Test/xUnit

```

## Makeコマンド
上記の「使用方法」のMakeコマンドの用意を行いました。

### プロジェクト作成

```powershell
PS C:\q-sharp-train> make project/<Template Name or Short Name>/<project name>
```
##### 使用例
```powershell
# プロジェクトの作成(プロジェクト名:sample)
PS C:\q-sharp-train> make project/console/sample
The template "Console Application" was created successfully.
# テストプロジェクトの作成(プロジェクト名:test-sample)
PS C:\q-sharp-train> make project/xunit/test-sample
The template "xUnit Test Project" was created successfully.
```

### プロジェクト実行

```powershell
# <project name>はsrc/配下のディレクトリ名です。
PS C:\q-sharp-train> make run/<project name>
```

##### 使用例
```powershell
PS C:\q-sharp-train> make run/sample
Hello quantum world!
```


### Q#用template一覧

```powershell
PS C:\q-sharp-train> make show/projects
```

##### 使用例

```powershell
PS C:\q-sharp-train> make show/projects            
The following template packages will be installed:
   Microsoft.Quantum.ProjectTemplates

Microsoft.Quantum.ProjectTemplates is already installed, version: 0.24.203411-beta, it will be replaced with version .
Microsoft.Quantum.ProjectTemplates::0.24.203411-beta was successfully uninstalled.
Success: Microsoft.Quantum.ProjectTemplates::0.24.201332 installed the following templates:
Template Name                  Short Name     Language  Tags
-----------------------------  -------------  --------  --------------
Class library                  classlib       Q#        Common/Library
Console Application            console        Q#        Common/Console
Quantum Application Honeywell  azq-honeywell  Q#        Common/Console
Quantum Application IonQ       azq-ionq       Q#        Common/Console
xUnit Test Project             xunit          Q#        Test/xUnit
```