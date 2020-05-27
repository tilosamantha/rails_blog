class PagesController < ApplicationController
  def index
    # return array of pages
    @pages = Page.all
    #this will return an array of all of the pages
    #render index.html.erb
  end

  def show
    # return a single page with unique ID
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # creates only in memory
  end

  def edit
  end

  def create 
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def update
  end
  
  def destroy
  end

  private
    def pages_params
      # {page: {title: 'post', author: 'you', body: 'asdkfhwe'}}
      # only permits title, author and body
      # if there were another attribute (ex: age), would not be shown for safety measures
      params.require( :page).permit(:title, :author,:body)
    end
end
