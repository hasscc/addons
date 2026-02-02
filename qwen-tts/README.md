# 千问TTS

免费快速的语音合成大模型API。 推荐配合 [ai_conversation](https://github.com/hasscc/ai-conversation) 集成使用。

[![添加加载项仓库](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgitee.com%2Fhasscc%2Faddons)

API地址:
- `http://4e0de88e-qwen-tts/v1`
- `http://homeassistant.local:28825/v1`

使用示例:
```shell
curl --request POST \
  --url http://homeassistant.local:28825/v1/audio/speech \
  --header 'Content-Type: application/json' \
  --data '{"voice":"mia", "input":"hello"}' \
  --output audio.wav
```

### [AI Conversation](https://github.com/hasscc/ai-conversation) 配置教程
1. 安装 AI Conversation 集成
   > 点击这里 [一键安装](https://my.home-assistant.io/redirect/hacs_repository/?category=integration&owner=hasscc&repository=ai-conversation)，安装完记得重启HA
2. [添加 AI Conversation 服务](https://my.home-assistant.io/redirect/config_flow_start/?domain=ai_conversation)，配置模型提供商
   > 服务商: 自定义; 接口: `http://4e0de88e-qwen-tts/v1`; 密钥留空
3. 添加TTS模型，模型ID随意，额外的请求参数参考:
   ```yaml
   voice: mia
   response_format: wav
   ```
4. 配置语音助手


### 🎼 内置音色
- `cherry`: Cherry / 芊悦
- `serena`: Serena / 苏瑶
- `ethan`: Ethan / 晨煦
- `chelsie`: Chelsie / 千雪
- `momo`: Momo / 茉兔
- `vivian`: Vivian / 十三
- `moon`: Moon / 月白
- `maia`: Maia / 四月
- `kai`: Kai / 凯
- `nofish`: Nofish / 不吃鱼
- `bella`: Bella / 萌宝
- `jennifer`: Jennifer / 詹妮弗
- `ryan`: Ryan / 甜茶
- `katerina`: Katerina / 卡捷琳娜
- `aiden`: Aiden / 艾登
- `bodega`: Bodega / 西班牙语-博德加
- `alek`: Alek / 俄语-阿列克
- `dolce`: Dolce / 意大利语-多尔切
- `sohee`: Sohee / 韩语-素熙
- `ono` anna: Ono Anna / 日语-小野杏
- `lenn`: Lenn / 德语-莱恩
- `sonrisa`: Sonrisa / 西班牙语拉美-索尼莎
- `emilien`: Emilien / 法语-埃米尔安
- `andre`: Andre / 葡萄牙语欧-安德雷
- `radio` gol: Radio Gol / 葡萄牙语巴-拉迪奥·戈尔
- `eldric` sage: Eldric Sage / 精品百人-沧明子
- `mia`: Mia / 精品百人-乖小妹
- `mochi`: Mochi / 精品百人-沙小弥
- `bellona`: Bellona / 精品百人-燕铮莺
- `vincent`: Vincent / 精品百人-田叔
- `bunny`: Bunny / 精品百人-萌小姬
- `neil`: Neil / 精品百人-阿闻
- `elias`: Elias / 墨讲师
- `arthur`: Arthur / 精品百人-徐大爷
- `nini`: Nini / 精品百人-邻家妹妹
- `ebona`: Ebona / 精品百人-诡婆婆
- `seren`: Seren / 精品百人-小婉
- `pip`: Pip / 精品百人-调皮小新
- `stella`: Stella / 精品百人-美少女阿月
- `li`: Li / 南京-老李
- `marcus`: Marcus / 陕西-秦川
- `roy`: Roy / 闽南-阿杰
- `peter`: Peter / 天津-李彼得
- `eric`: Eric / 四川-程川
- `rocky`: Rocky / 粤语-阿强
- `kiki`: Kiki / 粤语-阿清
- `sunny`: Sunny / 四川-晴儿
- `jada`: Jada / 上海-阿珍
- `dylan`: Dylan / 北京-晓
