

describe "cadastro" do
    
    it "novo usuário" do
        Database.new.delete_user("falecomcarolcalixto@gmail.com")

        result = HTTParty.post(
            "http://localhost:3001/user", 
            body: {full_name: "Carol Calixto", email: "falecomcarolcalixto@gmail.com", password: "pwd123"}.to_json,
            headers: {
                "Content-Type" => "application/json"
            }
        )
        puts result
        expect(result.response.code).to eql "200"
    end
end