if [ $# -ne 1 ]; then
	# the model could be a HuggingFace model name: google/gemma-3-12b-it
	# or a local folder: ./model_gemma3-12b-full-finetuning
	echo "Usage: $0 <model>"
	exit 1
fi

rm -rf results stdout.log stderr.log
source .venv/bin/activate
# https://github.com/triton-lang/triton/issues/8539
TRITON_PTXAS_PATH=`which ptxas` python3 evaluate_from_local.py --gpu_util 0.65 --model "$1" 1>stdout.log 2>stderr.log &
