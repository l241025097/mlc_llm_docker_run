/opt/miniconda3/envs/python3.11/bin/mlc_llm convert_weight /workspace/models/Qwen2.5-32B-Instruct \
    --device cuda:1 \
    --quantization q0f16 \
    -o /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC

/opt/miniconda3/envs/python3.11/bin/mlc_llm gen_config /workspace/models/Qwen2.5-32B-Instruct \
    --quantization q0f16 \
    --conv-template qwen2 \
    --tensor-parallel-shard 2 \
    -o /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC

mkdir -p /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC/libs

/opt/miniconda3/envs/python3.11/bin/mlc_llm compile /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC/mlc-chat-config.json \
    --device cuda \
    -o /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC/libs/Qwen2.5-32B-Instruct-q0f16-MLC-cuda.so

/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC \
    --model-lib /workspace/models/Qwen2.5-32B-Instruct-q0f16-MLC/libs/Qwen2.5-32B-Instruct-q0f16-MLC-cuda.so \
    --host 0.0.0.0
