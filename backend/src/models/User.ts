const bcrypt = require('bcrypt');

class User {

    constructor(
        public name: string,
        public email: string,
        public username: string,
        public password: string,
        public image: string,
    ) {
        this.password = bcrypt.hashSync(password, 10);
    }
    
}

export default User;
