module ApiCalls
  class JobsService < ApplicationService
    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
    end

    def call
      github_jobs_url_mrt = 'https://jobs.github.com/positions.json?markdown=true'
      github_jobs_url = 'https://jobs.github.com/positions.json?search=scrum'
      url_asduna = 'http://api.adzuna.com/v1/api/jobs/gb/search/1?app_id={40406207}&app_key={58173b23fa741ea1da20c99d3796b1b7}&results_per_page=20&what=javascript%20developer&content-type=application/json'
      parameters = {
        search: @parameters[:search],
        location: @parameters[:location]
      }.to_query
      puts "--------------------"
      puts parameters
      puts "-------------------"
      github_jobs_url += parameters
      response = Unirest.get(github_jobs_url,
      headers: {
        "Content-Type" => "application/json"
      }
    )

      return response.body
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