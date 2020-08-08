class PagesController < ApplicationController
  layout 'application'

  def jobs
    category = params[:categories].presence || nil
    category = category.to_param if category
    search = params[:key_search].presence || nil
    location = params[:location].presence || nil
    # location = params[:location].presence || nil
    full_time = params[:job_type].presence || nil

    if search != nil || location != nil || category != nil
      # params
      params[:search] = search
      params[:location]= location
      params[:category]= category
      
      response = ApiCalls::JobsService.call(params)
    else
      response = ApiCalls::JobsService.call(nil)
# 
      # response = (Unirest.get "https://jobs.github.com/positions.json?").body
    end
    @info = response
    @categories = ApiCalls::CategoriesService.call(params)
  end 

  def show
    @info = (Unirest.get "https://jobs.github.com/positions/#{params[:id]}.json").body
    # @info = Unirest.get('https://jobs.github.com/positions/a34e33ec-d7b3-4b7f-a3c2-1bf6d91b576a.json').body
  end

#   
end

# https://jobs.github.com/positions/a34e33ec-d7b3-4b7f-a3c2-1bf6d91b576a.json