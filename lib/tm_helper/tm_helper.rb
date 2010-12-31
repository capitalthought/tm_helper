require 'cgi'
require 'logger'

module TmHelper
  def self.convert_to_html string
    CGI.escapeHTML(string).gsub("\n", "<br/>")
  end
  
  def self.textmate_wrap string
    if self.running_rspec_bundle?
      self.convert_to_html string
    else
      string
    end
  end
  
  def self.running_in_textmate?
    ENV["TM_PROJECT_DIRECTORY"] || ENV["TM_FILEPATH"]
  end

  def self.running_rspec_bundle?
    defined? ::RSpec::Mate || defined? ::SpecMate
  end
end

if TmHelper.running_in_textmate? && TmHelper.running_rspec_bundle?
  module Kernel
    alias :orig_puts :puts
    def puts string
      orig_puts TmHelper.convert_to_html( string ) + "<br/>"
    end
  end
end
  
if TmHelper.running_in_textmate? && ENV["TM_SHOW_LOGS"]
  require 'active_support/core_ext/logger'
  class Logger
    alias :orig_info :info
    alias :orig_debug :debug
    alias :orig_warn :warn
    alias :orig_error :error
    
    def info string; puts TmHelper.textmate_wrap( string ); end
    def debug string; puts TmHelper.textmate_wrap( string ); end
    def warn string; puts TmHelper.textmate_wrap( string ); end
    def error string; puts TmHelper.textmate_wrap( string ); end
    
  end
end

