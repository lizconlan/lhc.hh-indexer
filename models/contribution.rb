class Contribution < ActiveRecord::Base
  belongs_to :section
end

class DivisionPlaceholder < Contribution
end

class MemberContribution < Contribution
end

class ProceduralContribution < Contribution
end

class QuoteContribution < Contribution
end

class TableContribution < Contribution
end

class TimeContribution < Contribution
end

class UnparsedDivisionPlaceholder < Contribution
end

class WrittenMemberContribution < Contribution
end