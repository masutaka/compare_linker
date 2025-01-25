require "json"
require "httpclient"
require "net/http"

class CompareLinker
  class GithubLinkFinder
    attr_reader :octokit, :gem_dictionary, :repo_owner, :repo_name, :homepage_uri

    def initialize(octokit, gem_dictionary)
      @octokit = octokit
      @gem_dictionary = gem_dictionary
    end

    def find(gem_name)
      gem_info = JSON.parse(
        HTTPClient.get_content("https://rubygems.org/api/v1/gems/#{gem_name}.json")
      )

      github_url = [
        gem_info["homepage_uri"],
        gem_info["source_code_uri"]
      ].find { |uri| uri.to_s.match(/github\.com\//) }

      if github_url = redirect_url(github_url)
        _, @repo_owner, @repo_name = github_url.match(%r!github\.com/([^/]+)/([^/#]+)!).to_a
      else
        @repo_owner, @repo_name  = gem_dictionary.lookup(gem_info["name"])
        @homepage_uri = gem_info["homepage_uri"]
      end

    rescue HTTPClient::BadResponseError, resolution_error_class
      @homepage_uri = "https://rubygems.org/gems/#{gem_name}"
    end

    def repo_full_name
      "#{@repo_owner}/#{repo_name}"
    end

    private

    def redirect_url(url, limit = 5)
      return nil if url.nil?
      return nil if limit <= 0

      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)

      case response
      when Net::HTTPSuccess
        url
      when Net::HTTPRedirection
        redirect_url(to_absolute(response['location'], uri), limit - 1)
      else
        nil
      end
    end

    def to_absolute(location, uri)
      return location if location =~ /\Ahttp/
      # RFC2394 violation?
      "#{uri.scheme}://#{uri.host}#{location}"
    end

    def resolution_error_class
      # Socket::ResolutionError is defined from ruby-3.3
      defined?(Socket::ResolutionError) ? Socket::ResolutionError : SocketError
    end
  end
end
