FROM "steamcmd/steamcmd:latest"

# FactoryServer.sh が root では実行できないため専用ユーザー作成
RUN apt-get update && apt-get install adduser -y && rm -rf /var/lib/apt/lists/*
RUN adduser steam --disabled-password --gecos ""

USER steam
WORKDIR /home/steam
# 環境変数を設定して、steamcmdが利用するディレクトリを変更、検証時の su では HOME も変わるっぽい
ENV HOME /home/steam 
RUN steamcmd +login anonymous +force_install_dir "/home/steam/.steam/steam/steamapps/common/SatisfactoryDedicatedServer" +app_update 1690800 -beta public +quit

# サーバー実行
WORKDIR /home/steam/.steam/steam/steamapps/common/SatisfactoryDedicatedServer
CMD ""
ENTRYPOINT ./FactoryServer.sh
