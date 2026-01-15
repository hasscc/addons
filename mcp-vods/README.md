# VODs MCP Server

mcp-vods 是一个专为剧迷设计的MCP服务器，为AI助手增加了电影/电视剧/动漫/短剧的搜索能力，并支持控制小米电视/投影/机顶盒直接播放影视。

## 配置
环境变量:
- `MITV_LIST_CFG`: 多台小米电视配置，可选，如: `客厅电视:192.168.1.11; 主卧电视:192.168.1.12`
- `MITV_LOCAL_IP`: 单台小米电视本地IP，可选

## 使用
1. [添加MCP集成](/_my_redirect/config_flow_start?domain=mcp)
    MCP服务地址(SSE):
    - `http://4e0de88e-mcp-vods/sse`
    - `http://homeassistant.local:28821/sse`
2. 重命名MCP配置条目，推荐: `vods`
3. 为 AI Conversation 添加MCP服务
    ![image](https://imtg.hacs.vip/file/AgACAgUAAyEGAASaAU1vAAOzaWcoUTaB6mHRHUYOCOtdOnAophAAAkYNaxuWPTlXN8-I5V_ZKIkBAAMCAAN3AAM4BA.png)
4. 通过语音助手对话或者调用HA服务
    ```yaml
    action: conversation.process
    data:
      agent_id: conversation.agent_glm_4_5_flash
      text: 在客厅电视上播放仙逆最新一集
    ```

### [AI Conversation](https://github.com/hasscc/ai-conversation) 配置教程
1. 通过HACS[一键安装](https://my.home-assistant.io/redirect/hacs_repository/?category=integration&owner=hasscc&repository=ai-conversation)集成
2. [添加集成](/_my_redirect/config_flow_start?domain=ai_conversation)并配置模型提供商
    - [智谱提供免费的AI模型](https://www.bigmodel.cn/invite?icode=EwilDKx13%2FhyODIyL%2BKabHHEaazDlIZGj9HxftzTbt4%3D)
3. 添加对话模型，勾选之前添加的MCP服务`vods`
4. 配置[语音助手](https://my.home-assistant.io/redirect/voice_assistants/)
