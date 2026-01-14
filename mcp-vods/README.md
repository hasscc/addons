# VODs MCP Server

一个用于追剧/追番的MCP服务器。

推荐配合 [ai_conversation](https://github.com/hasscc/ai-conversation) 集成使用。

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
