/opt/miniconda3/envs/python3.11/bin/mlc_llm convert_weight /workspace/models/Qwen2.5-32B-Instruct \
    --device cuda:1 \
    --quantization q4f32_1 \
    -o /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC

/opt/miniconda3/envs/python3.11/bin/mlc_llm gen_config /workspace/models/Qwen2.5-32B-Instruct \
    --quantization q4f32_1 \
    --conv-template qwen2 \
    --tensor-parallel-shard 2 \
    --prefill-chunk-size 4096 \
    -o /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC

mkdir -p /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC/libs

/opt/miniconda3/envs/python3.11/bin/mlc_llm compile /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC/mlc-chat-config.json \
    --device cuda \
    -o /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC/libs/Qwen2.5-32B-Instruct-q4f32_1-MLC-cuda.so

/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC \
    --model-lib /workspace/models/Qwen2.5-32B-Instruct-q4f32_1-MLC/libs/Qwen2.5-32B-Instruct-q4f32_1-MLC-cuda.so \
    --mode server \
    --host 0.0.0.0
