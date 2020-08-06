module ApiCalls
  class JobsService < ApplicationService
    attr_reader :params
    def initialize query_hash
      @params = query_hash
    end

    def call
      puts "---------------"
      puts "---------------"
      puts "---------------"
      puts "---------------"
      puts "---------------"
      puts "---------------"
      puts "---------------"
      parameters ="search=#{@params[:search]}" if @params[:search]
      github_jobs_url = 'https://jobs.github.com/positions?'
      response = (Unirest.get github_jobs_url,
      headers:{
        "Content-Type" => "application/json"
      },
      parameters:{
        "" => ""
      })
    
      puts response.code # Status code
      puts response.headers # Response headers
      puts response.body # Parsed body
      # puts response.raw_body # Unparsed body
    end
  end
end