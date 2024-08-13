require "yaml"

class CompareLinker
  class GemDictionary
    attr_reader :file, :rubygems

    def initialize
      @file = File.join(__dir__, '../../data/rubygems.yml')
    end

    # Look gem info up from Dictionary
    #
    # @param gem_name [String]
    # @return [Array<String>] [repo_owner, repo_name]
    # @return [Array<NilClass>] cannot look up
    def lookup(gem_name)
      repo_full_name = rubygems[gem_name]

      if repo_full_name
        repo_full_name.split("/")
      else
        [nil, nil]
      end
    end

    private

    def rubygems
      @rubygems ||= YAML.load(File.read(file))
    end
  end
end
