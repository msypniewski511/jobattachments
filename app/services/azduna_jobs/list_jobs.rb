module AzdunaJobs
  class ListJobs < ApplicationService
    attr_reader :parameters

    def initialize parameters
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      puts "--------------"
      parameters = parameters.join("&") if (parameters & parameters != '')
      @parameters = parameters ? ("&" + parameters) : nil
      puts "Ta Initializer JobService #{@parameters}"
      puts "W AzdunaJobs"
    end

    def call
      puts "call AZDUNJOBS" + @parameters
      parameters = @query
      url_asduna = "https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=#{adzuna_app_id}&app_key=#{adzuna_app_key}&results_per_page=10#{@parameters}"
      puts "Z all AzdunaJobs" + url_asduna
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
end