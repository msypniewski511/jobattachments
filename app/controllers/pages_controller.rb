class PagesController < ApplicationController
  def jobs

    description = params[:key_search]
    location = params[:localization] 
    # if params[:skills] !='' skills = params[:skills] 
    # if params[:job_type] !='' full_time = params[:job_type] 

    if description != ''
      location = 0
      full_time = true
      # key_search=ruby+on+rails&localization=&skills=&job_type=&button=
      response = Unirest.get "https://jobs.github.com/positions.json?key_search=#{description}"
      # response = find_job("node", location, full_time)
    else
      response = Unirest.get "https://jobs.github.com/positions.json?description=python&location=new+york",
      headers:{  }
    end
    @info = response.body

end 

def search
  description = (params[:key_search]) if params[:key_search] !=''
  location = params[:localization] if params[:localization] !=''
  skills = params[:skills] if params[:skills] !=''
  full_time = params[:job_type] if params[:job_type] !=''

  # description — A search term, such as "ruby" or "java". This parameter is aliased to search.
  # location — A city name, zip code, or other location search term.
  # lat — A specific latitude. If used, you must also send long and must not send location.
  # long — A specific longitude. If used, you must also send lat and must not send location.
  # full_time — If you want to limit results to full time positions set this parameter to 'true'.
  
  # unless key_search
  #   flash[:alert] = 'Country not found'
  #   return render action: :index
  # end

  response = find_job("node", location, full_time)
  
  # redirect_to :jobs
  if response
    respond_to do |format|
      @info = response.body
      format.html { render :pages_jobs_path, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  render :jobs, notice: 'Address was successfully destroyed.'

end
def index
  response = Unirest.get "https://nanosdk-countries-v1.p.rapidapi.com/countries?fields=alpha2%252Ccapital&alpha2=US",
  headers:{
    "X-RapidAPI-Host" => "nanosdk-countries-v1.p.rapidapi.com",
    "X-RapidAPI-Key" => "5746befc9fmsh8c81b824f5f4d2dp1b92ebjsn335e4ccd7679",
    "Content-Type" => "application/x-www-form-urlencoded"
  }
  @info = response.body
  puts "-------------------------"
  pust response.code
  puts response
end

private

  def request_api(url)
    puts "url: " + url
    response = Unirest.get(
      url,
      headers:{
      }
    )
    # return nil if response.status != 200
    puts "-------------------"
    puts "-------------------"
    puts "-------------------"
    puts "-------------------"
    puts "-------------------"
    puts "-------------------"
    puts response.code
    puts response.body
    # JSON.parse(response.body)
  end

  def find_job(description1 = "ruby", location1 = "new+york", full_time1 = true)

    params = {
      search: description1
    }
    # https://jobs.github.com/positions.json?search=node
    url =  "https://jobs.github.com/positions.json?"+params.to_query
    request_api(url)
  end
end
