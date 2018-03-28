require "yaml"
require "pry"

def load_library(file_path)
  # code goes here
  return_emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticon_lib = YAML.load_file(file_path)
  emoticon_lib.each do |meanings_string, emoticons_array|
    return_emoticon_hash["get_meaning"][emoticons_array[1]] = meanings_string
    return_emoticon_hash["get_emoticon"][emoticons_array[0]] = emoticons_array[1]
  end
  return_emoticon_hash
end

def get_japanese_emoticon(yaml_file_path, emoticon)
  # code goes here
  emoticon_reference = load_library(yaml_file_path)
  emoticon_reference["get_emoticon"].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file_path, emoticon)
  # code goes here
  emoticon_reference = load_library(yaml_file_path)
  emoticon_reference["get_meaning"].each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return meaning
    end
  end
  "Sorry, that emoticon was not found"
end
