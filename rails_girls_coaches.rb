require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra/base'
require 'haml'
require 'to_slug.rb'

class RailsGirlsCoaches < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/bucket_list_part_1' do
    haml :bucket_list_part_1
  end

  get '/bucket_list_part_2' do
    haml :bucket_list_part_2
  end

  get '/rg_answers_part_1' do
    haml :rg_answers_part_1
  end

  get '/rg_answers_part_2' do
    haml :rg_answers_part_2
  end

  get '/event_tracker_part_1' do
    haml :event_tracker_part_1
  end

  get '/event_tracker_part_2' do
    haml :event_tracker_part_2
  end

  get '/rails_reviews_part_1' do
    haml :rails_reviews_part_1
  end

  get '/rails_reviews_part_2' do
    haml :rails_reviews_part_2
  end

  get '/short_url_part_1' do
    haml :short_url_part_1
  end

  get '/upload_site' do
    haml :upload_site
  end

  get '/hello_world' do
    haml :hello_world
  end

  helpers do
    def action_for(action, desc="")
      well = ""
      well = "<div class='well'>#{desc}</div>" unless desc.empty?

      html = <<-HEREDOC
      <div class="tut">
        <label>
        <input type="checkbox" name="tut" value="#{desc.to_slug}"><span class="label label-success">Action</span>

        #{action}
        </label>
        #{well}
      </div>
      HEREDOC
    end

    def tutorial_for(brush_type, desc, commands, highlight=[])
      if brush_type == "plain"
        application = "Terminal"
        label = "inverse"
      else
        application = "Text-Editor"
        label = "warning"
      end

html = <<-END
<div class="tut">
<label>
<input type="checkbox" name="tut" value="#{desc.to_slug}"><span class="label label-#{label}">#{application}</span>
#{desc}
</label>
<script type="syntaxhighlighter" class="brush: #{brush_type}; highlight: #{highlight}"><![CDATA[
#{commands}
]]></script>
</div>
END
    end
  end
end
