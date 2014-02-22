require 'bundler'
Bundler.setup

require "active_record"

require './lib/indexer'
require "./lib/mappings"

require "./models/section"
require "./models/contribution"
require "./models/sitting"
require "./models/volume"

task :environment do
  config = YAML::load(File.open('config/database.yml'))
  ActiveRecord::Base.establish_connection(config)
end

desc "create indexes"
task :create_indexes do
  host = ENV['host']
  port = ENV['port']
  
  if host and port
    indexer = LHC::HHIndexer.new(host, port)
  else
    indexer = LHC::HHIndexer.new
  end
  
  Mappings.index_names.each do |index_name|
    begin
      indexer.create_index(index_name)
      p "created index: #{index_name}"
    rescue Elasticsearch::Transport::Transport::Errors::BadRequest => e
      if e.message.include?("IndexAlreadyExistsException")
        p "skipped index: #{index_name} (already exists)"
      else
        raise e # re-raise if it's not the error we were expecting
      end
    end
  end
end

desc "index all the things"
task :index_queue => :environment do
  #ensure the indexes are created properly
  Rake::Task["create_indexes"].execute
  
  require "action_view/helpers/sanitize_helper"
  sanitizer = HTML::FullSanitizer.new
  
  host = ENV['host']
  port = ENV['port']
  
  if host and port
    indexer = LHC::HHIndexer.new(host, port)
  else
    indexer = LHC::HHIndexer.new
  end
  section = Section.where.not(indexed: true).order("date ASC").limit(1).last
  
  while section
    # do index
    if section.sitting.house == "Commons" #faked, see model
      index_name = "commons_historic_hansard"
    else
      index_name = "lords_historic_hansard"
    end
    
    p section.hansard_ref
    
    text = section.contributions.map { |x| sanitizer.sanitize(x.text) }
    
    unless text.empty?
      doc = {
          title: section.title,
          text: text.join(" "),
          date: section.date,
          url: "http://hansard.millbanksystems.com/#{section.sitting.url}/#{section.slug}", # faked, see sitting model
          hansard_ref: section.hansard_ref, #faked, see model
          hansard_component: section.sitting.component, #faked, see model
          members: section.contributions.map { |x| x.member_name }.uniq,
          number: section.contributions.map { |x| x.question_no }.uniq.delete_if{ |x| x.nil? }
        }
      
      indexer.add_doc(index_name, doc)
    end
    
    # update the flag
    section.indexed = true
    section.save
    
    # get the next one
    section = Section.where.not(indexed: true).order("date ASC").limit(1).last
  end
end
