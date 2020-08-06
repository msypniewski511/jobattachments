class AddressesController < ApplicationController
  

  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def search
    countries = find_country(params[:country])
    unless countries
      flash[:alert] = 'Country not found'
      @addresses = Address.all
      return render action: :index
    end
  end
  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:city, :street, :street1, :street2, :country, :post_code)
    end

    def request_api(url, par_name, val)
      # post_key = ak_kdh96k99toM85adHd8xyIDxtS67la
      # https://api.ideal-postcodes.co.uk/v1/postcodes/ID11QD?api_key=iddqd&licensee=sk_i98n29d8dj3K

      # "X-RapidAPI-Key" => "736b11b0-d700-11ea-a70f-33466de77c38"
      response = Unirest.get "https://samsinfield-postcodes-4-u-uk-address-finder.p.rapidapi.com/ByPostcode/json?callback=return&postcode=LL29+8HT&key=NRU3-OHKW-J8L2-38PX&username=guest",
  headers:{
    "X-RapidAPI-Host" => "samsinfield-postcodes-4-u-uk-address-finder.p.rapidapi.com",
    "X-RapidAPI-Key" => "5746befc9fmsh8c81b824f5f4d2dp1b92ebjsn335e4ccd7679"
  }
      # response = Unirest.get(
      #   url,
      #   headers:{
      #     "X-RapidAPI-Host" => "jobattachment.p.rapidapi.com",
      #     "X-RapidAPI-Key" => "5746befc9fmsh8c81b824f5f4d2dp1b92ebjsn335e4ccd7679"
      #   }
      # )
      # URI.open(url) {|f|
      #   f.each_line {|line| p line}
      #   p f.base_uri         # <URI::HTTP:0x40e6ef2 URL:http://www.ruby-lang.org/en/>
      #   p f.content_type     # "text/html"
      #   p f.charset          # "iso-8859-1"
      #   p f.content_encoding # []
      #   p f.last_modified    # Thu Dec 05 02:45:02 UTC 2002
      # }
      # JSON.parse(Net::HTTP.get(URI.parse(url)))
      puts "--------------------------"
      puts response
     puts response.code # Status code
 puts response.headers # Response headers
puts response.body # Parsed body
puts response.raw_body # Unparsed body
      return nil if response.code != 200
      @addresses = Address.all
      JSON.parse(response.body)
    end
    def find_country(name)
      # request_api(
      #   "https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}"
      # )
      request_api(
        "https://restcountries-v1.p.rapidapi.com", "name", URI.encode(name)
      )
    end
end
