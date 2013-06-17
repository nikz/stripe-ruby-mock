require 'spec_helper'
require_stripe_examples

describe StripeMock::Instance do

  it_behaves_like_stripe do
    def test_data_source(type); StripeMock.instance.send(type); end
  end

  before { StripeMock.start }
  after { StripeMock.stop }

  it "handles both string and symbol hash keys" do
    string_params = {
      "id" => "str_abcde",
      :name => "String Plan"
    }
    res = StripeMock.instance.mock_request('post', '/v1/plans', 'api_key', string_params)
    expect(res[:id]).to eq('str_abcde')
    expect(res[:name]).to eq('String Plan')
  end

end
