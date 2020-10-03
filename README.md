# pandoc-latex-ja

## 概要

pandocで日本語MarkdownをPDFに変換するためのDocker Imageです。環境構築にいつも苦労するのでDockerで固めました。GitlabのCIにも対応しています。  
[=> DockerHub](https://hub.docker.com/r/tttza/pandoc-latex-ja)

[pandoc公式latexイメージ](https://hub.docker.com/r/pandoc/latex)に対して、以下のパッケージを追加しています。

 * bxjscls 
 * luatexja 
 * collection-langjapanese 
 * ctex 
 * type1cm 

以下の組み合わせで変換可能なことを確認しています。

* pdf-engine: xelatex, lualatex
* documentclass: bxjsarticle

## 使い方

基本的には[公式イメージ](https://github.com/pandoc/dockerfiles#usage)と同じです。
ただし、GitLabのCIに対応させるために一部修正しています。pandocのコマンドはダブルクォーテーションで囲ってください。

```bash
docker run -it --volume `pwd -W`:/build tttza/pandoc-latex-ja:latest "pandoc [OPTIONS]"
```

### 使用例

変換例(bash):
```bash
docker run -it --volume `pwd -W`:/build tttza/pandoc-latex-ja:latest "pandoc sample/sample.md -o publish/sample.pdf -V classoption="pandoc" -V documentclass=bxjsarticle --pdf-engine=xelatex --filter=pandoc-crossref"
```

変換例(cmd):
```cmd
docker run -it --volume %cd%:/build tttza/pandoc-latex-ja:latest "pandoc sample/sample.md -o publish/sample.pdf -V classoption="pandoc" -V documentclass=bxjsarticle --pdf-engine=xelatex --filter=pandoc-crossref"
```

変換例(PowerShell):
```powershell
docker run -it --volume ${pwd}:/build tttza/pandoc-latex-ja:latest "pandoc sample/sample.md -o publish/sample.pdf -V classoption='pandoc' -V documentclass=bxjsarticle --pdf-engine=xelatex --filter=pandoc-crossref"
```

`defaults.yml`を用いた変換例(bash):
```bash
docker run -it --volume `pwd -W`:/build tttza/pandoc-latex-ja:latest "pandoc -d defaults.yml"
```

## GitLab CI例

`.gitlab-ci.yml`:
```yaml
build:
  image: tttza/pandoc-latex-ja:latest
  script:
    - pandoc -o sample.pdf sample/sample.md -V documentclass=bxjsarticle --pdf-engine=xelatex
  artifacts:
    paths:
      - "*.pdf"
```


## Docker Imageのビルド

```bash
docker build -t tttza/pandoc-latex-ja .
```

