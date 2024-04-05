class PagesController < ApplicationController
  def about
    @page_info = PageInfo.find_by(page_type: 'about')
  end

  def contact
    @page_info = PageInfo.find_by(page_type: 'contact')
  end
end
