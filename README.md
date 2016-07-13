
# さくらのクラウド オブジェクトストレージ用 s3cmd

[さくらのクラウド オブジェクトストレージ](http://cloud.sakura.ad.jp/specification/option/#option-content03)の管理にs3cmdを利用するためのコンテナです。

## `Dockerfile` links

[`latest`](https://github.com/yamamoto-febc/s3cmd-docker/tree/master/)[(Dockerfile)](https://github.com/yamamoto-febc/s3cmd-docker/tree/master/Dockerfile)


## 使い方

以下の環境変数を指定して起動します。
アクセスキーID、シークレットアクセスキーは
さくらのクラウドのコントロールパネルから取得しておいてください。
([参考:さくらのクラウドニュース:「オブジェクトストレージ」を手軽に利用する（s3cmd編）](http://cloud-news.sakura.ad.jp/2015/02/20/objectstorage_s3cmd/))

* ACCESS_KEY : アクセスキーID
* SECRET_KEY : シークレットアクセスキー

ファイルのアップロード/ダウンロードを行う際は適宜VOLUMEの指定(-v)などを行ってください。

### 起動コマンド書式

```bash
docker run -it --rm -e ACCESS_KEY=アクセスキーID \
                    -e SECRET_KEY=シークレットアクセスキー \
                    sacloud/s3cmd 実行したいコマンド
```

#### バケット一覧取得の例
```bash
docker run -it --rm -e ACCESS_KEY=アクセスキーID \
                    -e SECRET_KEY=シークレットアクセスキー \
                    sacloud/s3cmd ls
```

#### バケット内のオブジェクト一覧取得(バケット名:`wanwano`の場合)
```bash
docker run -it --rm -e ACCESS_KEY=アクセスキーID \
                    -e SECRET_KEY=シークレットアクセスキー \
                    sacloud/s3cmd ls s3://wanwano
```

#### ファイルのアップロード(カレントディレクトリにある`test.txt`をバケット`wanwano`へアップロードする場合)
```bash
docker run -it --rm -e ACCESS_KEY=アクセスキーID \
                    -e SECRET_KEY=シークレットアクセスキー \
                    -v $PWD:/work \                    
                    sacloud/s3cmd put /work/test.txt s3://wanwano
```

#### ファイルのダウンロード(バケット`wanwano`の中の`test.txt`をカレントディレクトリへダウンロードする場合)
```bash
docker run -it --rm -e ACCESS_KEY=アクセスキーID \
                    -e SECRET_KEY=シークレットアクセスキー \
                    -v $PWD:/work \                    
                    sacloud/s3cmd get s3://wanwano/test.txt /work/test.txt 
```

#### バケット内のオブジェクトの削除
```bash
docker run -it --rm -e ACCESS_KEY=アクセスキーID \
                    -e SECRET_KEY=シークレットアクセスキー \
                    -v $PWD:/work \                    
                    sacloud/s3cmd del s3://wanwano/test.txt
```

s3cmdコマンドの詳しい使い方は[さくらのクラウドニュース:「オブジェクトストレージ」を手軽に利用する（s3cmd編）](http://cloud-news.sakura.ad.jp/2015/02/20/objectstorage_s3cmd/)などを参照ください。
