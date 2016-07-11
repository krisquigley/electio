def create_consignment
 stub_request(:post, "https://api.electioapp.com/consignments/").
         with(:body => File.read("spec/fixtures/create_consignment.json")).
         to_return(:status => 201, :body => "{
                \"links\": [
                  {
                    \"rel\": \"detail\",
                    \"href\": \"/v1/consignments/EC-000-0MS-MJE\"
                  }
                ]
              }", :headers => {})
end

def find_consignment 
  stub_request(:get, "https://api.electioapp.com/consignments/EC-000-0MS-MJE").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'api.electioapp.com', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.open("spec/fixtures/consignment.json", "r"), :headers => {})
end