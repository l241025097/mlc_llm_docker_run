from modelscope import snapshot_download
from modelscope.hub.api import HubApi

from huggingface_hub import snapshot_download as snapshot_download_hf, login

def execute():
    # snapshot_download('Shanghai_AI_Laboratory/internlm2-chat-1_8b', local_dir="/workspace/models/intern_lm/internlm2-chat-1_8b")
    # snapshot_download('Shanghai_AI_Laboratory/internlm2-chat-7b', local_dir="/workspace/models/intern_lm/internlm2-chat-7b")
    # snapshot_download('Shanghai_AI_Laboratory/internlm2_5-7b-chat', local_dir="/workspace/models/intern_lm/internlm2_5-7b-chat")
    # snapshot_download('Shanghai_AI_Laboratory/internlm2_5-1_8b-chat', local_dir="/workspace/models/intern_lm/internlm2_5-1_8b-chat")
    # snapshot_download('qwen/Qwen2-7B-Instruct', local_dir="/workspace/models/qwen/Qwen2-7B-Instruct")
    # snapshot_download('ZhipuAI/codegeex4-all-9b', local_dir="/workspace/models/glm/codegeex4-all-9b")
    # snapshot_download('ZhipuAI/glm-4-9b-chat', local_dir="/workspace/models/glm/glm-4-9b-chat")
    # snapshot_download('deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct', local_dir="/workspace/models/deepseek/DeepSeek-Coder-V2-Lite-Instruct")
    # snapshot_download("Qwen/Qwen2.5-32B-Instruct", local_dir="/home/lyn/python/llm/mlc_llm/models/Qwen2.5-32B-Instruct")
    # snapshot_download("Shanghai_AI_Laboratory/internlm2_5-20b-chat", local_dir="/home/lyn/python/llm/mlc_llm/models/internlm2_5-20b-chat")

    # snapshot_download_hf("mlc-ai/Qwen2.5-7B-Instruct-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Qwen2.5-7B-Instruct-q0f16-MLC", max_workers=1)
    # snapshot_download_hf("mlc-ai/Qwen2.5-32B-Instruct-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Qwen2.5-32B-Instruct-q0f16-MLC", max_workers=1)
    # snapshot_download_hf("mlc-ai/internlm2_5-20b-q4f32_1-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/internlm2_5-20b-q4f32_1-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/internlm2_5-7b-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/internlm2_5-7b-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/gemma-2-9b-it-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/gemma-2-9b-it-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Qwen2.5-7B-Instruct-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Qwen2.5-7B-Instruct-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Qwen2.5-14B-Instruct-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Qwen2.5-14B-Instruct-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Qwen2.5-14B-Instruct-q4f16_1-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Qwen2.5-14B-Instruct-q4f16_1-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Llama-3.1-8B-Instruct-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Llama-3.1-8B-Instruct-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Hermes-3-Llama-3.1-8B-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Hermes-3-Llama-3.1-8B-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/gemma-2-27b-it-q4f16_1-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/gemma-2-27b-it-q4f16_1-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/gemma-2-27b-it-q4f32_1-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/gemma-2-27b-it-q4f32_1-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Mistral-7B-Instruct-v0.3-q0f16-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Mistral-7B-Instruct-v0.3-q0f16-MLC", max_workers=1)
    snapshot_download_hf("mlc-ai/Mixtral-8x7B-Instruct-v0.1-q4f16_1-MLC", local_dir="/home/lyn/python/llm/mlc_llm/models/Mixtral-8x7B-Instruct-v0.1-q4f16_1-MLC", max_workers=1)
    snapshot_download_hf("mistralai/Mistral-Small-Instruct-2409", local_dir="/home/lyn/python/llm/mlc_llm/models/Mistral-Small-Instruct-2409", max_workers=1)
    snapshot_download_hf("mistralai/Ministral-8B-Instruct-2410", local_dir="/home/lyn/python/llm/mlc_llm/models/Ministral-8B-Instruct-2410", max_workers=1)

    

        
    

    



    

    

    

    
    

if __name__ == "__main__":
    execute()
