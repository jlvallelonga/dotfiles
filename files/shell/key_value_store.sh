
# Get
# get value from yaml key value store at $KV_STORE
kvg() {
  key=$(piped_or_next_arg $@)
  if present $key; then
    shift
  fi

  if empty $key; then
    key=$(yq 'keys' $KV_STORE | yq 'join(" ")' | xargs gum filter)
  fi

  if kv_key_exists $key; then
    yq ".$key" $KV_STORE
  else
    # --type flag is forwarded to gum
    value=$(gum_prompt --prompt "key $key not exist. Please provide value now:" $@)
    if present $value; then
      kvs $key $value
    fi
  fi
}

kv_key_exists() {
  key=$(piped_or_next_arg $@)

  exists=$(yq "has(\"$key\")" $KV_STORE)
  if [[ $exists == "true" ]]; then
    return 0
  else
    return 1
  fi
}

# set value in yaml key value store at $KV_STORE
# if it doesn't exist, create it
# if it does exist, update it
kvs() {
  key=$1
  value=$2

  if empty $key; then
    error "You must provide a key to set"
    return 1
  fi

  # set as the correct type: string, boolean, number
  if [[ $value =~ ^[0-9]+$ ]]; then
    value=$value
  elif [[ $value == "true" || $value == "false" ]]; then
    value=$value
  else
    value="\"$value\""
  fi

  yq ".$key = $value" -i $KV_STORE
}

kve() {
  oide ~/kv.yaml
}

kvc() {
  cat ~/kv.yaml
}

# remove key from yaml key value store at $KV_STORE
kvr() {
  key=$(piped_or_next_arg $@)
  if empty $key; then
    key=$(yq 'keys' $KV_STORE | yq 'join(" ")' | xargs gum filter)
  fi

  yq "del(.\"$key\")" -i $KV_STORE
}
