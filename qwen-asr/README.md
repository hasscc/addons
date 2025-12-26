# Qwen3-ASR

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
