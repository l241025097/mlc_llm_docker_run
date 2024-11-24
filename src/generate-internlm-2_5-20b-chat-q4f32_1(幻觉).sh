/opt/miniconda3/envs/python3.11/bin/mlc_llm convert_weight /workspace/models/internlm2_5-20b-chat \
    --device cuda:1 \
    --quantization q4f32_1 \
    -o /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC

/opt/miniconda3/envs/python3.11/bin/mlc_llm gen_config /workspace/models/internlm2_5-20b-chat \
    --quantization q4f32_1 \
    --conv-template chatml \
    --tensor-parallel-shard 2 \
    -o /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC

mkdir -p /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC/libs

/opt/miniconda3/envs/python3.11/bin/mlc_llm compile /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC/mlc-chat-config.json \
    --device cuda \
    -o /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC/libs/internlm2_5-20b-chat-q4f32_1-MLC-cuda.so

/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC \
    --model-lib /workspace/models/internlm2_5-20b-chat-q4f32_1-MLC/libs/internlm2_5-20b-chat-q4f32_1-MLC-cuda.so \
    --mode server \
    --host 0.0.0.0
