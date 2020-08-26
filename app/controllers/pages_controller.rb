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
    @query = query


    # if params[:what] || params[:location] || params[:category]
      
      response = ApiCalls::JobsService.call(query)
      # @categories = ApiCalls::CategoriesService.call(query)
    # else
      # response = ApiCalls::JobsService.call(nil)
      # @categories = ApiCalls::CategoriesService.call(nil)
# # 
#       # response = (Unirest.get "https://jobs.github.com/positions.json?").body
#     end
    # tmp = {}
    # jobs = []
    # # @zapis = JobSearchResult.new()
    # response.payload.each do |v|
    #   # @zapis = JobSearchResult.new(v)
    #   # puts "=========================="
    #   # puts "PRZED"
    #   # p v

    #   puts "PO"
    #   # p v['id']
    #   # tmp = tmp.merge!(tmp)
    #   # p tmp
    #   jobs.push(tmp)
    #   # p jobs[v['id'].to_i]
    #   # jobs.merge!(tmp)
    #   # p jobs
    #   # tmp.merge(tmp)

    # end
    # p jobs
    # puts "PRZED"
    # jobs = response.payload
    # jobs = (jobs).map {|e| e.delete_if {|key, value| key == "adref" } }
    # p jobs
    # # p (response.payload).class
    # # jobs.extract! { |e| e == ('adref') }
    # jobs.delete('adref')
    # p jobs.select { |e| e == 'id'}
    # p jobs
    # @map_info = jobs

    
    info = response.payload
    # p info
    create_map info
    if response && response.success?
      # flash['success'] = "Search"
      @query
      @info = (response.payload)
      # @info = JobSearchResult.all
      # puts @info
      @categories = ApiCalls::CategoriesService.call(query)
      session[:jobs] = @map_info
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



  def create_map info
      # @map = GMap.n(ew("map_div")
      # @map.control_init(:large_map => true, :map_type => true)

      # create markers one for each location found
      markers = {}
      count = 1
      @markery = {}
      info.each do |job|
        
        str = "<div style='width: 350px'>" +
        "<label>#{job['title']} (#{job['company']['display_name']})</label> <br/>" + 
        "#{job['title']}</div>"
        # puts str
        @markery[count] = ([job['latitude'], job['longitude'], title: job['title'],  info_window: str])
        count = count + 1
        
      end
      puts @markery
      @markery.to_json
      # @map.overlay_global_init(GMarkerGroup.new(true, markers),"job_markers")
      # zoom to the source
      # @map.center_zoom_init([@jobs.first['latitude'], @jobs.first['longitude']], 12)
  end
end
