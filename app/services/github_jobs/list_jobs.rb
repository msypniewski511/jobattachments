# frozen_string_literal: true

module GithubJobs
  class ListJobs < ApplicationService
    include Draper::Decoratable

    attr_reader :parameters

    def initialize parameters
      puts 'W GITHUB-'
      parameters = parameters.join('&') if parameters & parameters != ''
      @parameters = parameters || nil
      puts @parameters
      @parameters = @parameters.gsub('what', 'search').gsub('where', 'location').to_s
      puts "Ta Initializer Github #{@parameters}"
      puts 'W GithubJobs'
    end

    def call
      puts 'call github' + @parameters
      parameters = @query
      response = nil
      github_jobs_url = "https://jobs.github.com/positions.json?#{@parameters}"
      puts 'Z all GithubJobs' + github_jobs_url
      response = Unirest.get(github_jobs_url, header: { 'content-type': 'application/json' })
      response = response.body
    rescue Unirest::Error => e
      OpenStruct.new({ success?: false, error: e })
    else
      OpenStruct.new({ success?: true, payload: response })
    end
  end
end
