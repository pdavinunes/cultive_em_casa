const conexao = require('../conexao')

module.exports = {
    async index(request, response) {

        const sql = "SELECT * FROM users;";

        conexao.query(sql, function(error, results, fields){
            if(error) return response.json(error)
            conexao.end()
            return response.json(results)
        })
    },
    
    async store(request, response){
        const {username, email, password} = request.body

        console.log(username, email, password);
        const sql = `INSERT INTO 
                        users (username, email, password) 
                    VALUES ('${username}', '${email}', '${password}')`
        
        conexao.query(sql, function(error, results, fields){
            if(error) {
                console.log(error)
                return response.json(error.json)
            }
            conexao.end();
            return response.json({status: '201'})
        })

    },

    async update(request, response){

    },

    async destroy(request, response){

    },
}