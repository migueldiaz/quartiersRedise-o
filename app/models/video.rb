class Video < ActiveRecord::Base
 auto_html_for :url do
 
   # simple_format
    #image
   
    youtube(:width => 400, :height => 250)
    vimeo(:width => 400, :height => 250, :show_title => false) 
    metacafe(:width => 400, :height => 250, :show_title => false) 
    #link :target => "_blank", :rel => "nofollow"
  end
end
