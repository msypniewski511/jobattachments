class PeopleController < ApplicationController
  wrap_parameters :person, include: [:keywords_ids]
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  # before_action :zmien_vars, only: [create]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    @page_title = "People"
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @page_title = "Profile for " + @person.full_name
  end

  # GET /people/new
  def new
    @page_title = 'Add a new person'
    @person = Person.new
    addresses = @person.addresses.build
    companies = @person.companies.build
    
    # company_address = companies.addresses.build
  end


  # GET /people/1/edit
  def edit
    @page_title = 'Editing ' + @person.full_name
    @addresses = @person.addresses.build || @person.addresses.new
    @companies = @person.companies.build || @person.companies.new
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    # @person.addresses.build()
    respond_to do |format|
      if @person.save
        # @person.addresses.create
        # @person.companies.create
        
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        @addresses = @person.addresses
        @page_title = 'Add a new person'
        addresses = @person.addresses.build
        companies = @person.companies.build
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|

      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        set_associations
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(
        :_slugs, :title, :first_name, :last_name, :telephone, :mobile_phone, :job_title, :date_of_birth, :gender, :notes, :keywords, 
          addresses_attributes: [:id, :city, :street, :street1, :street2, :post_code, :_destroy], 
          companies_attributes: [:id, :name, :telephone, :fax, :website, addresses_attributes: [:id, :city, :street, :street1, :street2, :country, :post_code, :_destroy]])
    end

    def get_gender
      [['male', 1], ['female', 1]]
    end

    def set_associations
      @page_title = 'Edit a new person'
      @page_title = 'Editing ' + @person.full_name
      @addresses = @person.addresses.build || @person.addresses.new
      @companies = @person.companies.build || @person.companies.new
    end
end
