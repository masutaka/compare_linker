require "ostruct"

class CompareLinker
  class Formatter
    class Base
      attr_reader :g, :downgraded

      def format(gem_info)
        @g = OpenStruct.new(gem_info)
        @downgraded = downgrade?(g.old_ver, g.new_ver, g.old_tag, g.new_tag, g.old_rev, g.new_rev)
        post_format
      end

      private

      def post_format
        raise NotImplementedError
      end

      def downgrade?(old_ver, new_ver, old_tag, new_tag, old_rev, new_rev)
        Gem::Version.new(new_ver) < Gem::Version.new(old_ver) ||
          (old_tag && new_tag && Gem::Version.new(to_ver(new_tag)) < Gem::Version.new(to_ver(old_tag))) ||
          (old_rev && new_rev && Gem::Version.new(to_ver(new_rev)) < Gem::Version.new(to_ver(old_rev)))
      rescue ArgumentError # Gem::Version raise ArgumentError if it is invalid as version
        false
      end

      def to_ver(tag)
        return $1 if tag =~ /(\d+(?:\.\d+)+)\z/
      end

      def github_url(repo_owner, repo_name)
        "https://github.com/#{repo_owner}/#{repo_name}"
      end

      def github_compare_url(repo_owner, repo_name, old_tag, new_tag)
        range = downgraded ? "#{new_tag}...#{old_tag}" : "#{old_tag}...#{new_tag}"
        "#{github_url(repo_owner, repo_name)}/compare/#{range}"
      end
    end
  end
end
