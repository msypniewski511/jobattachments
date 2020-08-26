module AzdunaJobs
  class ListJobs < ApplicationService
    attr_reader :parameters, :page

    def initialize parameters, page=1
      # puts "--------------"
      # puts "--------------"
      # puts "--------------"
      # puts "--------------"
      # puts "--------------"
      # puts "--------------"
      # puts "--------------"
      # p parameters
      # parameters['page'] ? @page = page : nil
      parameters = parameters.join("&") if (parameters & parameters != '')
      @parameters = parameters ? ("&" + parameters) : nil
      # puts "Ta Initializer JobService #{@parameters}"
      # puts "W AzdunaJobs"
    end

    def call
      # puts "call AZDUNJOBS" + @parameters
      parameters = @query
      url_asduna = "https://api.adzuna.com/v1/api/jobs/gb/search/2?app_id=#{adzuna_app_id}&app_key=#{adzuna_app_key}&results_per_page=10#{@parameters}"
      # puts "Z all AzdunaJobs" + url_asduna
      response = Unirest.get(url_asduna, header:{'content-type':'application/json'})
      response = response.body['results']
    rescue Unirest::Error => e
      OpenStruct.new({success?: false, error: e})
    else
      OpenStruct.new({success?: true, payload: response})
    end

    private

    def adzuna_app_id
      Figaro.env.adzuna_app_id
    end

    def adzuna_app_key
      Figaro.env.adzuna_app_key
    end
  end



  class CategoriesService < ApplicationService
    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
    end

    def call
      # "http://api.adzuna.com/v1/api/jobs/de/search?callback=foo&what=sales"
      github_jobs_url_mrt = 'https://jobs.github.com/positions.json?markdown=true'
      github_jobs_url = 'https://jobs.github.com/positions.json?search=scrum'
      url_asduna = "https://api.adzuna.com/v1/api/jobs/gb/categories?app_id=#{Figaro.env.adzuna_app_id}&app_key=#{Figaro.env.adzuna_app_key}&results_per_page=10&content-type=application/json"

      response = Unirest.get(url_asduna, header:{'content-type':'application/json'})
      puts response.body['results']
      return response.body['results']
    end
    private

    def adzuna_app_id
      Figaro.env.adzuna_app_id
    end

    def adzuna_app_key
      Figaro.env.adzuna_app_key
    end
  end
end