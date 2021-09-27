## 環境構築

### ケース1 Codespacesをブラウザ上で利用する場合

Codespacesの利用権限がない場合、誰かに聞いてみてください

1. https://github.com/wyrd-team/dbc-s8-ruby から、code > codespaces > New Codespace > 4 core > Create Codespace
2. `$ bin/setup`

2回目以降は、code > codespaces > 開きたいCodespace

### ケース2 CodespacesをVSCodeから利用する場合

Codespacesの利用権限がない場合、誰かに聞いてみてください

1. https://github.com/wyrd-team/dbc-s8-ruby から、code > codespaces > New Codespace > 4 core > Create Codespace
2. 画面下に出現する Open This Codespace In VScode Desktop をクリックし、VSCodeが立ち上がるので、ブラウザのCodespacesはタブを閉じる
3. `$ bin/setup`

2回目以降は、VSCodeのようこそ画面から選択・起動できる

### ケース3 ローカルでRemote Containerを立ち上げる場合

1. VSCodeにVSCode Remoteプラグインをインストール
2. Reopen in Container
3. `$ bin/setup`