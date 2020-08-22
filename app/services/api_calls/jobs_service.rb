module ApiCalls

  class JobsService < ApplicationService
    include Draper::Decoratable
    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
      "W initialize JOBSERVICE"
    end

    def call
      #11 azduna results
      # puts "Z call JobServices przed"
      results = (AzdunaJobs::ListJobs.new(@parameters).call)
      
      # r.save
      # results = GithubJobs::ListJobs.new(@parameters).call
      # puts "Z call JobServices"
      # puts results


      # parameters = @query
      # # "http://api.adzuna.com/v1/api/jobs/de/search?callback=foo&what=sales"
      # github_jobs_url_mrt = 'https://jobs.github.com/positions.json?markdown=true'
      # github_jobs_url = 'https://jobs.github.com/positions.json?search=scrum'
      # url_asduna = "https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=#{adzuna_app_id}&app_key=#{adzuna_app_key}&results_per_page=200#{@parameters}"
      # puts url_asduna
      # korwa = "https://api.adzuna.com/v1/api/jobs/gb/search/1?app_id=40406207&app_key=58173b23fa741ea1da20c99d3796b1b7&results_per_page=20&what=ruby"
      # response = Unirest.get(url_asduna, header:{'content-type':'application/json'})
      
      response = results.payload

    #   r = JobSearchResult.new()
    #   r.id = response.id
      
    #  r.description = response.description
    #  r.created = response.created
    #  r.title = response.title
    # #  r.salary_min = response.salary_min
    #  r.longitude = response.longitude
    #  r.latitude = response.latitude
    #  r.location = response.location
      
    #  r.salary_is_predicted = response.salary_is_predicted
    
      
    #  r.contract_time = response.contract_time
    #  r.redirect_url = response.redirect_url
    #  r.category = response.category['tag']
    #  r.contract_type = response.contract_type
    #  r.company = response.company
    #  r.salary_max = response.salary_max
    #   puts r
    rescue StandardError => e
      OpenStruct.new({success?: false, error: e})
    else
      # puts response
      OpenStruct.new({success?: true, payload: response})
      # 
      # return response
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
      url_asduna = "https://api.adzuna.com/v1/api/jobs/gb/categories?app_id=#{Figaro.env.adzuna_app_id}&app_key=#{Figaro.env.adzuna_app_key}&content-type=application/json"

    
      response = Unirest.get(url_asduna, header:{'content-type':'application/json'})
      return response.body['results']
    end
  end


end






# GET /positions.json
# Search for jobs by term, location, full time vs part time, or any combination of the three. All parameters are optional.

# Parameters

# description — A search term, such as "ruby" or "java". This parameter is aliased to search.
# location — A city name, zip code, or other location search term.
# lat — A specific latitude. If used, you must also send long and must not send location.
# long — A specific longitude. If used, you must also send lat and must not send location.
# full_time — If you want to limit results to full time positions set this parameter to 'true'.
# Examples

# https://jobs.github.com/positions.json?description=python&full_time=true&location=sf
# https://jobs.github.com/positions.json?search=node
# https://jobs.github.com/positions.json?lat=37.3229978&long=-122.0321823
