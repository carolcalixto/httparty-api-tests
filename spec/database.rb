require "pg"

class Database

    def initialize
        conn = { host: "pgdb", dbname: "nflix", user: "postgres", password: "qaninja"}
        @connection = PG.connect(conn)
    end

    def delete_user(email)
        @connection.exec("DELETE from public.users WHERE email = '#{email}';")
    end

end