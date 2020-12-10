# 作成するDockerイメージのベースとなるイメージを指定
FROM ruby:2.6.5

# Dockerイメージビルド時に、Dockerコンテナ内で実行するコマンドを定義
RUN apt-get update -qq && \
    apt-get install -y  build-essential \ 
                        libpq-dev \
                        nodejs

# 作業ディレクトリの作成
RUN mkdir /app_name 
# Dockerfileをもとに生成したDockerコンテナ内で使える環境変数を指定
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

# ホストからGemfileをコンテナ上にコピー
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileをbundle install
RUN gem install bundler && bundle install
ADD . $APP_ROOT