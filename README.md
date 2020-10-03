# pandoc-latex-ja with pandoc-crossref

## 概要

日本語MarkdownからpandocでPDFへの変換をおこなうDocker Imageです。GitlabのCIにも対応しています。

[pandoc公式latexイメージ](https://hub.docker.com/r/pandoc/latex)に対して、以下のパッケージを追加しています。

 * bxjscls 
 * luatexja 
 * collection-langjapanese 
 * ctex 
 * type1cm 

以下の組み合わせで変換可能なことを確認しています。

* pdf-engine: xelatex, lualatex
* documentclass: bxjsarticle
  
個人的には変換が早いxelatexをお薦めします。

## 使い方


基本的には[公式イメージ](https://github.com/pandoc/dockerfiles#usage)と同じ。
ただし、GitLabのCIに対応させるため、一部修正している。(WorkingDirectoryを/buildに変更している。)Pandocのオプションは最後につける。

```bash
docker run -it --volume `pwd -W`:/build tttza/pandoc-latex-ja:1.1 [OPTIONS]
```

### 使用例

`sample/sample.md`を変換する例(bash):
```bash
docker run -it --volume `pwd -W`:/build tttza/pandoc-latex-ja:1.1 sample/sample.md -o publish/sample.pdf -V classoption="pandoc" -V documentclass=bxjsarticle --pdf-engine=xelatex --filter=pandoc-crossref
```

`sample/sample.md`を変換する例(cmd):
```cmd
docker run -it --volume %cd%:/build tttza/pandoc-latex-ja:1.1 sample/sample.md -o publish/sample.pdf -V classoption="pandoc" -V documentclass=bxjsarticle --pdf-engine=xelatex --filter=pandoc-crossref
```

`sample/sample.md`を変換する例(PowerShell):
```powershell
docker run -it --volume ${pwd}:/build tttza/pandoc-latex-ja:1.1 sample/sample.md -o publish/sample.pdf -V classoption="pandoc" -V documentclass=bxjsarticle --pdf-engine=xelatex --filter=pandoc-crossref
```

`defaults.yml`を使用して`sample/sample.md`を変換する例(bash):  #見やすいのでおすすめ
```bash
docker run -it --volume `pwd -W`:/build tttza/pandoc-latex-ja:1.1 -d defaults.yml
```

## Docker Imageのビルド

```bash
docker build -t tttza/pandoc-latex-ja:1.1 .
```

