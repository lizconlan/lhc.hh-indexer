class Sitting < ActiveRecord::Base
  attr_reader :house, :component, :url
  
  belongs_to :volume
  has_many :sections
end

class CommonsWrittenAnswersSitting < Sitting
  def house
    "Commons"
  end
  
  def component
    "Written Answers"
  end
  
  def url
    "written_answers/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class CommonsWrittenStatementsSitting < Sitting
  def house
    "Commons"
  end
  
  def component
    "Written Statements"
  end
  
  def url
    "written_statements/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class GrandCommitteeReportSitting < Sitting
  def house
    "Lords"
  end
  
  def component
    "Grand Committee Report"
  end
  
  def url
    "grand_committee_report/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class HouseOfCommonsSitting < Sitting
  def house
    "Commons"
  end
  
  def component
    "Debates and Oral Answers"
  end
  
  def url
    "commons/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class HouseOfLordsReport < Sitting
  def house
    "Lords"
  end
  
  def component
    "Lords Report"
  end
  
  def url
    "lords_reports/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class HouseOfLordsSitting < Sitting
  def house
    "Lords"
  end
  
  def component
    "Debates and Oral Answers"
  end
  
  def url
    "lords/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class LordsWrittenAnswersSitting < Sitting
  def house
    "Lords"
  end
  
  def component
    "Written Answers"
  end
  
  def url
    "written_answers/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class LordsWrittenStatementsSitting < Sitting
  def house
    "Lords"
  end
  
  def component
    "Written Statements"
  end
  
  def url
    "written_statements/#{date.strftime("%Y/%b/%d").downcase}"
  end
end

class WestminsterHallSitting < Sitting
  def house
    "Commons"
  end
  
  def component
    "Westminster Hall"
  end
  
  def url
    "westminster_hall/#{date.strftime("%Y/%b/%d").downcase}"
  end
end