class Mappings
  def self.index_names
    ["commons_historic_hansard", "lords_historic_hansard"]
  end
  
  def self.all_mappings
    {
      commons_historic_hansard:{
        contents: {
          section: {
            properties: {
              title: { type: "string", index: "analyzed" },
              text:  { type: "string", index: "analyzed" },
              date:  { type: "date", index: "analyzed" },
              hansard_component: { type: "string", index: "not_analyzed" },
              hansard_ref: { type: "string", index: "analyzed" },
              bill_title: { type: "string", index: "analyzed"},
              extended_bill_title: { type: "string", index: "analyzed"},
              members: { type: "string", index: "not_analyzed" },
              number: { type: "string", index: "analyzed" },
              asked_by: { type: "string", index: "analyzed" },
              subject: { type: "string", index: "analyzed" },
              department: { type: "string", index: "analyzed" },
              chair: { type: "string", index: "analyzed" },
              url: { type: "string", index: "not_analyzed" }
            },
          }
        }
      },
      lords_historic_hansard:{
        contents: {
          section: {
            properties: {
              title: { type: "string", index: "analyzed" },
              text:  { type: "string", index: "analyzed" },
              date:  { type: "date", index: "analyzed" },
              hansard_component: { type: "string", index: "not_analyzed" },
              hansard_ref: { type: "string", index: "analyzed" },
              bill_title: { type: "string", index: "analyzed"},
              extended_bill_title: { type: "string", index: "analyzed"},
              members: { type: "string", index: "not_analyzed" },
              number: { type: "string", index: "analyzed" },
              asked_by: { type: "string", index: "analyzed" },
              subject: { type: "string", index: "analyzed" },
              department: { type: "string", index: "analyzed" },
              chair: { type: "string", index: "analyzed" },
              url: { type: "string", index: "not_analyzed" }
            },
          }
        }
      }
    }
  end
end