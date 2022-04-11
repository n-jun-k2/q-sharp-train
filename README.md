# Q# 開発パイロットプロジェクト

- [Q# コマンドライン操作](https://docs.microsoft.com/ja-jp/azure/quantum/how-to-command-line-local?tabs=tabid-cmdline)
- [Q# プログラミング言語ユーザー ガイド](https://docs.microsoft.com/ja-jp/azure/quantum/user-guide/)
- [Q# プログラムを実行する方法](https://docs.microsoft.com/ja-jp/azure/quantum/user-guide/host-programs?tabs=tabid-python)

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