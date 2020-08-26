class CustomerController < ApplicationController
  layout 'application'
  before_action :set_categories
  
  
  def map
    result = Figaro.env.moja_localizacja
    loc = get_localization result
    @current_localization = loc
    info
    @markers
    respond_to do |format|
      format.html {}
      format.json { }
    end
  end

  def info
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
    @query = query
    page = 1
      p query
      # @info = JobSearchResult.all
      response = ApiCalls::JobsService.call(query, page)
     
    info = response.payload
    # response.payload.each do |e|
    #   # p e['id'].to_i
    #   # p e['description']
    #   # p e['adref']
      
    #   # p e['created']
    #   # p remove_html e['title']
    #   # p e['salary_min']
    #   # p e['longitude']
    #   # p e['latitude']
    #   # p e['location']
    #   # p e['company']
    #   # puts''
    #   # puts "-------------------------------"
    #   # pp e

    # end
    puts "-------------------------------"
    # p info
    # p info
    create_map info
    # create_map @info
    # if @info
    if response && response.success?
      @query
      @info = (response.payload)
      # @info = JobSearchResult.all
      # puts @info 
      session[:jobs] = @map_info
    else
      # redirect_to pages_jobs_path, danger: "Subscription was created, but there was a problem with the vendor."
      @info = nil
      @categories = nil
    end

  end


  def search
  end




  def show
    @info = (Unirest.get "https://jobs.github.com/positions/#{params[:id]}.json").body
    # @info = Unirest.get('https://jobs.github.com/positions/a34e33ec-d7b3-4b7f-a3c2-1bf6d91b576a.json').body
  end


  private
   def set_categories
    @categories = ApiCalls::CategoriesService.call("zapytani")
   end

  def create_map info
      # create markers one for each location found
      markers = {}
      count = 0
      @markers = []
      info.each do |job|
        pp job
        # job['latitude'] == nil || job['longitude'] == nil && continue
        
        str = "<div style='width: 350px'>" +
        "<label>#{job['title']} (#{job['company']['display_name']})</label> <br/>" + 
        "#{job['title']}</div>"
        # @markers[count]={id: job['id'], location: [job['latitude'], job['longitude']], title: job['title'],  info_window: str}
        
        @markers << ({id: job['id'], title: job['title'],:lat => job['latitude'],lng: job['longitude'], info: str, url: job['redirect_url']}).to_json

        count = count + 1
        # @markers = [1,2,3]
      end
      # puts @markers
      @markers.to_json

      # @map.overlay_global_init(GMarkerGroup.new(true, markers),"job_markers")
      # zoom to the source
      # @map.center_zoom_init([@jobs.first['latitude'], @jobs.first['longitude']], 12)
  end

  def remove_html obj
    obj.sub!(/<strong>/, '').sub('</strong>', '')
    # obj.sub!('<\strong>', '')
    # obj.sub!(/<\strong>/, '')
  end

  def get_localization arg
    if Rails.env.development?
      return Figaro.env.moja_localizacja
    else
      return request.location
    end
  end
end
