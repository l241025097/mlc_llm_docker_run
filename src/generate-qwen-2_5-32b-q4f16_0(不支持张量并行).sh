/opt/miniconda3/envs/python3.11/bin/mlc_llm convert_weight /workspace/models/Qwen2.5-32B-Instruct \
    --device cuda:1 \
    --quantization q4f16_0 \
    -o /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC

/opt/miniconda3/envs/python3.11/bin/mlc_llm gen_config /workspace/models/Qwen2.5-32B-Instruct \
    --quantization q4f16_0 \
    --conv-template qwen2 \
    --tensor-parallel-shard 2 \
    -o /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC

mkdir -p /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC/libs

# 报错：NotImplementedError: KN layout (q3f16_0 and q4f16_0) is not supported for tensor parallelism
/opt/miniconda3/envs/python3.11/bin/mlc_llm compile /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC/mlc-chat-config.json \
    --device cuda \
    -o /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC/libs/Qwen2.5-32B-Instruct-q4f16_0-MLC-cuda.so

/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC \
    --model-lib /workspace/models/Qwen2.5-32B-Instruct-q4f16_0-MLC/libs/Qwen2.5-32B-Instruct-q4f16_0-MLC-cuda.so \
    --host 0.0.0.0
