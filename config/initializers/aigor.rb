
aigor_conf_yml = YAML.load(ERB.new(File.read("#{Rails.root}/config/aigor.yml")).result)[Rails.env]
Rails.application.config.aigor = OpenStruct.new(aigor_conf_yml)
