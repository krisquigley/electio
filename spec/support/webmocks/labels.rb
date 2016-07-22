def get_labels
  stub_request(:get, "https://api.electioapp.com/labels/EC-000-0MS-MJE").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => '{
                                                "File" : "aGVsbG8=\n",
                                                "ContentType" : "application/pdf"
                                              }', :headers => {})
end