/opt/miniconda3/envs/python3.11/bin/mlc_llm chat \
    /workspace/models/internlm2_5-7b-q0f16-MLC \
    --overrides "tensor_parallel_shards=2"


/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/internlm2_5-7b-q0f16-MLC \
    --mode server \
    --host 0.0.0.0 \
    --overrides "tensor_parallel_shards=2"
