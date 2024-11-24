/opt/miniconda3/envs/python3.11/bin/mlc_llm chat \
    /workspace/models/gemma-2-9b-it-q0f16-MLC \
    --overrides "tensor_parallel_shards=2"


/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/gemma-2-9b-it-q0f16-MLC \
    --mode interactive \
    --host 0.0.0.0 \
    --overrides "tensor_parallel_shards=2"
