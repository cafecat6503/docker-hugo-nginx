# docker-hugo-nginx

hugoサイトをビルドしてnginxでホストする奴

## 環境変数の説明

### args
        - GITHUB_USER gitのユーザー名
        - GITHUB_TOKEN: 'example' プル用のトークン
        - GITHUB_REPOSITORY  'example-user/example-repo.git' githubのリポジトリ。書き方は左記参考
        - HUGO_VERSION: '0.81.0' hugoのバージョン