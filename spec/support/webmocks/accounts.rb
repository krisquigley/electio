def find_account
  stub_request(:get, "https://api.electioapp.com/accounts/person@domain.com").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.open("spec/fixtures/account.json", "r"), :headers => {})
end

def find_reference_account
  stub_request(:get, "https://api.electioapp.com/accounts/abcda6ef-a56f-4dea-825c-8bcb201a3714").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => File.open("spec/fixtures/account.json", "r"), :headers => {})
end

def create_account
  stub_request(:post, "https://api.electioapp.com/accounts/").
         with(:body => File.read("spec/fixtures/create_account.json"),
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 201, :body => '{"Reference":"5208ec56-0cf6-4a60-8b01-068b93913243","Roles":[{"CustomerReference":"1d964507-048d-41c1-af73-ac016ddf97bc","Reference":"6ebc5896-0072-426e-b18d-f7d80420fef9","Name":"Administrator","Description":"Administrator","Type":"BuiltIn","Permissions":[{"Key":"GetCustomer","Name":"GetCustomer","Action":1,"Access":1,"Type":null}]},{"CustomerReference":"1d964507-048d-41c1-af73-ac016ddf97bc","Reference":"a3e4ca51-4257-4bb9-8c5d-362ca6e6a79a","Name":"Packer","Description":"Aroleforpackerstoallowthemaccesstorequiredfunctionsonly","Type":"Custom","Permissions":[{"Key":"GetCustomer","Name":"GetCustomer","Action":1,"Access":1,"Type":null}]}],"ShippingLocationRestrictions":["ManStore","ManWarehouse"],"CustomerReference":"170bbf7d-9e4a-4e4d-bf92-f6ccff1dda3a","Title":"Mr","FirstName":"Stuart","LastName":"Little","EmailAddress":"stuart.little@email.com","LanguageCode":"en","TimeZoneId":0,"IsEnabled":true,"LandLineNumber":null,"MobileNumber":"07845115877"}', :headers => {})
end

def update_account
 stub_request(:put, "https://api.electioapp.com/accounts/").
         with(:body => File.read("spec/fixtures/update_account.json"),
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'Host'=>'api.electioapp.com', 'Ocp-Apim-Subscription-Key'=>'test', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
end