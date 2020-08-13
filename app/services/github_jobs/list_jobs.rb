module GithubJobs
  class ListJobs < ApplicationService
    attr_reader :parameters

    def initialize parameters
      puts "W GITHUB-"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      parameters = parameters.join("&") if (parameters & parameters != '')

      @parameters = parameters ? ("&" + parameters) : nil
      puts "Ta Initializer Github #{@parameters}"
      puts "W GithubJobs"
    end

    def call
      puts "call github" + @parameters
      parameters = @query
      response = nil
      github_jobs_url = "https://jobs.github.com/positions.json?search=scrum#{@parameters}"
      puts "Z all GithubJobs" + github_jobs_url
      response = Unirest.get(github_jobs_url, header:{'content-type':'application/json'})
      response = response.body
    rescue Unirest::Error => e
      OpenStruct.new({success?: false, error: e})
    else
      OpenStruct.new({success?: true, payload: response})
    end

    private

  end
end