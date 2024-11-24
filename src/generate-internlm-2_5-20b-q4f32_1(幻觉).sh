/opt/miniconda3/envs/python3.11/bin/mlc_llm serve \
    /workspace/models/internlm2_5-20b-q4f32_1-MLC \
    --mode server \
    --host 0.0.0.0 \
    --overrides "tensor_parallel_shards=2;prefill_chunk_size=4096;gpu_memory_utilization=0.8;max_num_sequence=128"
