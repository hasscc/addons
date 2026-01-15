# Qwen ASR

免费快速的语音识别大模型API。

推荐配合 [ai_conversation](https://github.com/hasscc/ai-conversation) 集成使用。

API地址:
- `http://4e0de88e-qwen-asr/v1`
- `http://homeassistant.local:28820/v1`

支持模型:
- `qwen3-asr`
- `qwen3-asr:itn` 启用逆文本标准化

使用示例:
```shell
curl --request POST \
  --url http://homeassistant.local:28820/v1/audio/transcriptions \
  --header 'Content-Type: multipart/form-data' \
  --form model=qwen3-asr-flash \
  --form file='@audio.wav'
```

### [AI Conversation](https://github.com/hasscc/ai-conversation) 配置教程
1. 安装 AI Conversation 集成
   > 点击这里 [一键安装](https://my.home-assistant.io/redirect/hacs_repository/?category=integration&owner=hasscc&repository=ai-conversation)，安装完记得重启HA
2. [添加 AI Conversation 服务](https://my.home-assistant.io/redirect/config_flow_start/?domain=ai_conversation)，配置模型提供商
   > 服务商: 自定义; 接口: `http://4e0de88e-qwen-asr/v1`; 密钥留空
3. 添加STT模型
4. 配置语音助手
