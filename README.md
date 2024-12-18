# 模型转化
#### q0f16
#### q0f32
#### q3f16_0
#### q3f16_1
#### q4f16_0
#### q4f16_1
#### q4f32_1
#### q4f16_2
#### q4f16_autoawq
#### q4f16_ft
#### e5m2_e5m2_f16
#### e4m3_e4m3_f16
#### e4m3_e4m3_f16_max_calibrate
/opt/miniconda3/envs/python3.11/bin/mlc_llm convert_weight /workspace/models/Qwen2.5-32B-Instruct \
    --device cuda:1 \
    --quantization q4f16_1 \
    -o /workspace/models/Qwen2.5-32B-Instruc-q4f16_1-MLC

# 生成模型配置文件
/opt/miniconda3/envs/python3.11/bin/mlc_llm gen_config /workspace/models/Qwen2.5-32B-Instruct \
    --quantization q4f16_1 \
    --conv-template qwen2 \
    --tensor-parallel-shard 2 \
    -o /workspace/models/Qwen2.5-32B-Instruc-q4f16_1-MLC

# 编译模型
#### 可选：编译生成.so文件
#### 模型部署时指定--model-lib .so文件，则--overrides参数不起作用
#### 模型部署时不指定--model-lib .so文件，则部署时会先执行模型“编译”，在tmp目录编译临时.so文件，可以通过--overrides参数配置“编译参数”
/opt/miniconda3/envs/python3.11/bin/mlc_llm compile /workspace/models/Qwen2.5-32B-Instruc-q4f16_1-MLC/mlc-chat-config.json \
    --device cuda \
    -o /workspace/models/Qwen2.5-32B-Instruc-q4f16_1-MLC/libs/Qwen2.5-32B-Instruc-q4f16_1-MLC-cuda.so

# overrides 使用方法
--overrides "max_num_sequence=32;max_total_seq_length=4096;tensor_parallel_shards=2"

# overrides 参数说明
max_num_sequence: 等于max_batch_size，设置KV缓存序列的最大数量
max_total_seq_length: 设置所有缓存KV序列的最大长度
max_single_sequence_length: 设置单个序列的最大长度
gpu_memory_utilization: GPU显存使用率，填0~1的小数，默认为0.85
context_window_size: 上下文窗口尺寸
prefill_chunk_size: 预填充的序列长度
tensor_parallel_shards: 张量并行，填GPU数量
pipeline_parallel_stages: 流水线并行，填GPU数量

# 模型测试
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"model": "/workspace/models/Qwen2.5-32B-Instruc-q4f32_1-MLC", "messages": [{"role": "user", "content": "以我的父亲为题，写一个1000字的作文"}]}' \
  http://127.0.0.1:8000/v1/chat/completions

# 模型部署
/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
/workspace/models/Qwen2.5-32B-Instruc-q4f16_1-MLC \
--model-lib /workspace/models/Qwen2.5-32B-Instruc-q4f16_1-MLC/libs/mlc-cuda.so \
--host 0.0.0.0 \
--overrides "tensor_parallel_shards=2;gpu_memory_utilization=0.95"

docker run -d --rm --gpus all \
-v /home/lyn/python/llm/mlc_llm/models:/workspace/models \
--ipc host \
-p 8000:8000 \
l241025097/mlc_llm:12.3-amd64-dev68 \
/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
/workspace/models/internlm2_5-20b-chat-q4f32_1-MLC \
--model-lib /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC/libs/internlm2_5-20b-chat-q4f32_1-MLC-cuda.so \
--host 0.0.0.0

docker run -it --rm --gpus all \
-v /home/lyn/python/llm/mlc_llm/models:/workspace/models \
-p 8000:8000 \
--entrypoint /bin/bash \
--ipc host \
l241025097/mlc_llm:12.3-amd64-dev68

# 需要两个源码文件
mkdir -p /path/to/mlc_llm_docker_run/modules && cd /path/to/mlc_llm_docker_run/modules
git clone --recursive https://github.com/mlc-ai/relax.git tvm-unity
git clone --recursive https://github.com/mlc-ai/mlc-llm.git

cd ..
tar -zcvf modules.tar.gz modules

# git加速
git config --global http.proxy 'socks5h://127.0.0.1:1080'
git config --global https.proxy 'socks5h://127.0.0.1:1080'

# wheels文件下载地址 https://mlc.ai/wheels
mlc_ai_nightly_*.whl
mlc_llm_nightly_*.whl

# miniconda下载
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
