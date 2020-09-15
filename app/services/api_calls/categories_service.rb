# frozen_string_literal: true

module ApiCalls
  class CategoriesService < ApplicationService
    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
    end

    def call
      # "http://api.adzuna.com/v1/api/jobs/de/search?callback=foo&what=sales"
      github_jobs_url_mrt = 'https://jobs.github.com/positions.json?markdown=true'
      github_jobs_url = 'https://jobs.github.com/positions.json?search=scrum'
      url_asduna = "https://api.adzuna.com/v1/api/jobs/gb/categories?app_id=#{Figaro.env.adzuna_app_id}&app_key=#{Figaro.env.adzuna_app_key}&content-type=application/json"

      response = Unirest.get(url_asduna, header: { 'content-type': 'application/json' })
      response.body['results']
    end
  end
end
