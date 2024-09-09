#!/bin/bash

transcribe() {
  whisper-ctranslate2 --language ja --model large-v2 "$@"
}
