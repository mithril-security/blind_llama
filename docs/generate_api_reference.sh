# script to generate the python API reference
# pdoc3 must be installed (pip install pdoc3)
pip install pdoc3   
pdoc --html --skip-errors --template-dir docs/pdoc_template -o docs/ client/blind_llama --force
sed -i '/<p>Generated by <a href="https:\/\/pdoc3.github.io\/pdoc" title="pdoc: Python API documentation generator"><cite>pdoc<\/cite> 0.10.0<\/a>.<\/p>/d' docs/blind_llama/*.html

# Add meta description tags to specific HTML files
sed -i '/<head>/a <meta name="description" content="blind_llama package: Secure AI request handling with functions like create() and classes like Client for BlindLlama server connection.">' docs/blind_llama/index.html
sed -i '/<head>/a <meta name="description" content="blind_llama.errors module: Details of error handling in BlindLLama.">' docs/blind_llama/errors.html
sed -i '/<head>/a <meta name="description" content="blind_llama.completion module: Secure AI model predictions with create() function and the Client class. Data confidentiality assured.">' docs/blind_llama/completion.html
sed -i '/<head>/a <meta name="description" content="blind_llama.request_adapters module: This module implements requests: TransportAdapter, PoolManager, ConnectionPool and HTTPSConnection">' docs/blind_llama/request_adapters.html
sed -i '/<head>/a <meta name="description" content="Explore blind_llama.pb: Delve into licensing_pb2, grpc, protocol buffer code, and client-server classes with detailed documentation.">' docs/blind_llama/pb/index.html
sed -i '/<head>/a <meta name="description" content="Explore blind_llama.pb.licensing_pb2_grpc: Client and server classes corresponding to protobuf-defined services.">' docs/blind_llama/pb/licensing_pb2_grpc.html
sed -i '/<head>/a <meta name="description" content="Explore blind_llama.pb.licensing_pb2: Delve into generated protocol buffer code.">' docs/blind_llama/pb/licensing_pb2.html
sed -i '/<head>/a <meta name="description" content="Unlock blind_llama.verify: Functions like check_event_log(), check_quote(), ensuring secure, error-proof programming.">' docs/verify.html

# List of files to process
files=("index" "errors" "completion" "pb/index" "pb/licensing_pb2" "pb/licensing_pb2_grpc" "request_adapters" "verify")

# Define the link tag
link_tag="<link rel=\"canonical\" href=\"https://blindllama.mithrilsecurity.io/en/latest/blind_llama/completion.html\">"

# Loop through the files and insert the link tag
for file in "${files[@]}"; do
  # Check if the file exists before modifying it
  if [ -e "docs/blind_llama/$file.html" ]; then
    sed -i '/<meta name="description" content=""/d' "docs/blind_llama/$file.html"
    sed -i "/<head>/a $link_tag" "docs/blind_llama/$file.html"
  fi
done

set -e