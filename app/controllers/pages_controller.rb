class PagesController < ApplicationController
  layout 'application'

  def jobs
    query = []
    query << "q=#{params[:q]}" if params[:q]
    query << "what=#{params[:what]}" if params[:what]
    query << "where=#{params[:location]}" if params[:location]
    query << "category=#{params[:category]}" if params[:category]
    max_days_old = (params[:max_days_old] && params[:max_days_old] != "") ? "max_days_old=#{params[:max_days_old]}" : "max_days_old=5"
    query << max_days_old
    puts "Z kontolera: #{query}"
    # byebug
    # puts request.location || "localhost"



    # if params[:what] || params[:location] || params[:category]
      
      response = ApiCalls::JobsService.call(query)
      # @categories = ApiCalls::CategoriesService.call(query)
    # else
      # response = ApiCalls::JobsService.call(nil)
      # @categories = ApiCalls::CategoriesService.call(nil)
# # 
#       # response = (Unirest.get "https://jobs.github.com/positions.json?").body
#     end
    

    if response && response.success?
      # flash['success'] = "Search"
      @info = PagesDecorator.decorate(response.payload)
      @categories = ApiCalls::CategoriesService.call(query)
    else
      # redirect_to pages_jobs_path, danger: "Subscription was created, but there was a problem with the vendor."
      @info = nil
      @categories = nil
    end
  end






  def show
    @info = (Unirest.get "https://jobs.github.com/positions/#{params[:id]}.json").body
    # @info = Unirest.get('https://jobs.github.com/positions/a34e33ec-d7b3-4b7f-a3c2-1bf6d91b576a.json').body
  end

#   
end

# https://jobs.github.com/positions/a34e33ec-d7b3-4b7f-a3c2-1bf6d91b576a.json