# 智谱TTS

免费快速的语音合成大模型API。 推荐配合 [ai_conversation](https://github.com/hasscc/ai-conversation) 集成使用。

安装后切换到配置页面，添加`ZAI_USERID`和`ZAI_TOKEN`环境变量，可在[`audio.z.ai`](https://audio.z.ai)登录后，通过F12开发者工具在控制台执行`localStorage['auth-storage']`获取。

[![添加加载项仓库](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgitee.com%2Fhasscc%2Faddons)

API地址:
- `http://4e0de88e-zai-tts/v1`
- `http://homeassistant.local:28823/v1`

使用示例:
```shell
curl --request POST \
  --url http://homeassistant.local:28823/v1/audio/speech \
  --header 'Content-Type: application/json' \
  --data '{"voice":"system_001", "input":"hello", "speed":1.0, "volume":1}' \
  --output output.wav
```

### [AI Conversation](https://github.com/hasscc/ai-conversation) 配置教程
1. 安装 AI Conversation 集成
   > 点击这里 [一键安装](https://my.home-assistant.io/redirect/hacs_repository/?category=integration&owner=hasscc&repository=ai-conversation)，安装完记得重启HA
2. [添加 AI Conversation 服务](https://my.home-assistant.io/redirect/config_flow_start/?domain=ai_conversation)，配置模型提供商
   > 服务商: 自定义; 接口: `http://4e0de88e-zai-tts/v1`; 密钥留空
3. 添加TTS模型，模型ID随意，额外的请求参数参考:
   ```yaml
   voice: system_003 # 支持克隆的音色
   speed: 1.5
   response_format: wav
   ```
4. 配置语音助手


### 🎼 内置音色
`system_001`: 活泼女声
`system_002`: 通用男声
`system_003`: 温柔女声
