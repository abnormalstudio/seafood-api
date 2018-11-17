require "rails_helper"

RSpec.describe SeafoodApiSchema do
  let(:context) { {} }
  let(:variables) { {} }

  def execute
    res = SeafoodApiSchema.execute(
      query_string,
      context: context,
      variables: variables
    )

    # Print any errors
    if res["errors"]
      pp res
    end

    res
  end

  describe "executing a query" do
    let!(:scan) { create(:scan) }

    let(:query_string) { %|{
      catch(id: "ABC123") {
        id
        fish {
          species
        }
        fishery {
          name
        }
        scans(first: 5) {
          edges {
            node {
              scanner
            }
          }
        }
      }
    }| }

    it "returns result" do
      result = execute

      expect(result["data"].to_h).to eq({
        "catch"=>{
          "id"=>"ABC123",
          "fish"=>{"species"=>"Tuna"},
          "fishery"=>{"name"=>"Tony's Tuna Fishing"},
          "scans"=>{
            "edges"=>[
              {"node"=>{"scanner"=>"Quebec Importing"}}
            ]
          }
        }
      })
    end
  end
end