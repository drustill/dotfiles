set -l llm_commands (__llm_extract_commands)

complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a prompt -d 'Execute a prompt'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a aliases -d 'Manage model aliases'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a chat -d 'Hold an ongoing chat with a model.'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a collections -d 'View and manage collections of embeddings'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a embed -d 'Embed text and store or return the result'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a embed-models -d 'Manage available embedding models'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a embed-multi -d 'Store embeddings for multiple strings at once'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a install -d 'Install packages from PyPI into the same environment as LLM'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a keys -d 'Manage stored API keys for different models'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a llama-cpp -d 'Commands for registering llama.cpp GGML models with LLM'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a logs -d 'Tools for exploring logged prompts and responses'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a models -d 'Manage available models'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a ollama -d 'Commands for working with models hosted on Ollama'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a openai -d 'Commands for working directly with the OpenAI API'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a plugins -d 'List installed plugins'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a python -d 'Run Python interpreter, passing through any arguments'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a similar -d 'Return top N similar IDs from a collection'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a templates -d 'Manage stored prompt templates'
complete -f -c llm -n "not __fish_seen_subcommand_from $llm_commands" -a uninstall -d 'Uninstall Python packages from the LLM environment'


# complete -f -c llm -n "__fish_seen_subcommand_from models; and not __fish_seen_subcommand_from list default" -a list -d List available models
# complete -f -c llm -n "__fish_seen_subcommand_from models; and not __fish_seen_subcommand_from list default" -a default -d Show or set the default model

# complete -f -c llm -n "__fish_seen_subcommand_from models; and not __fish_seen_subcommand_from $(__llm_get_choices models)" -a "$(__llm_get_choices models)"

# complete -f -c llm -n "__fish_seen_subcommand_from aliases" -a list -d "List current aliases"
# complete -f -c llm -n "__fish_seen_subcommand_from aliases" -a path -d "Output the path to the aliases.json file"
# complete -f -c llm -n "__fish_seen_subcommand_from aliases" -a remove -d "Remove an alias"
# complete -f -c llm -n "__fish_seen_subcommand_from aliases" -a set -d "Set an alias for a model"
# complete -f -c llm collections -n "not __fish_seen_subcommand_from " -a list -d "View a list of collections"
# complete -f -c llm collections -n "not __fish_seen_subcommand_from " -a delete -d "Delete the specified collection"
# complete -f -c llm collections -n "not __fish_seen_subcommand_from " -a path -d "Output the path to the embeddings database"
# complete -f -c llm embed-models -n "not __fish_seen_subcommand_from " -a list -d "List available embedding models"
# complete -f -c llm embed-models -n "not __fish_seen_subcommand_from " -a default -d "Show or set the default embedding model"
# complete -f -c llm keys -n "not __fish_seen_subcommand_from " -a list -d "List names of all stored keys"
# complete -f -c llm keys -n "not __fish_seen_subcommand_from " -a path -d "Output the path to the keys.json file"
# complete -f -c llm keys -n "not __fish_seen_subcommand_from " -a set -d "Save a key in the keys.json file"
# complete -f -c llm llama-cpp -n "not __fish_seen_subcommand_from " -a add-model -d "Register a GGML model you have already downloaded with LLM"
# complete -f -c llm llama-cpp -n "not __fish_seen_subcommand_from " -a download-model -d "Download and register a model from a URL"
# complete -f -c llm llama-cpp -n "not __fish_seen_subcommand_from " -a models -d "List registered GGML models"
# complete -f -c llm llama-cpp -n "not __fish_seen_subcommand_from " -a models-dir -d "Display the path to the directory holding downloaded..."
# complete -f -c llm llama-cpp -n "not __fish_seen_subcommand_from " -a models-file -d "Display the path to the models.json file"
# complete -f -c llm logs -n "not __fish_seen_subcommand_from " -a list -d "Show recent logged prompts and their responses"
# complete -f -c llm logs -n "not __fish_seen_subcommand_from " -a off -d "Turn off logging for all prompts"
# complete -f -c llm logs -n "not __fish_seen_subcommand_from " -a on -d "Turn on logging for all prompts"
# complete -f -c llm logs -n "not __fish_seen_subcommand_from " -a path -d "Output the path to the logs.db file"
# complete -f -c llm logs -n "not __fish_seen_subcommand_from " -a status -d "Show current status of database logging"
# complete -f -c llm models -n "not __fish_seen_subcommand_from " -a list -d "List available models"
# complete -f -c llm models -n "not __fish_seen_subcommand_from " -a default -d "Show or set the default model"
# complete -f -c llm ollama -n "not __fish_seen_subcommand_from " -a list-models -d "List models that are available locally on Ollama server."
# complete -f -c llm openai -n "not __fish_seen_subcommand_from " -a models -d "List models available to you from the OpenAI API"
# complete -f -c llm templates -n "not __fish_seen_subcommand_from " -a list -d "List available prompt templates"
# complete -f -c llm templates -n "not __fish_seen_subcommand_from " -a edit -d "Edit the specified prompt template using the default $EDITOR"
# complete -f -c llm templates -n "not __fish_seen_subcommand_from " -a path -d "Output the path to the templates directory"
# complete -f -c llm templates -n "not __fish_seen_subcommand_from " -a show -d "Show the specified prompt template"
