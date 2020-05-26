class Token{

    isValid(token){
        const iss=this.getDecodedPayload(token).iss
        return iss=="http://localhost:8000/api/auth/login"||
        iss=="http://localhost:8000/api/auth/signup"
    }
    getPayload(token){
        return token.split('.')[1];
    }

    getDecodedPayload(token){
        return JSON.parse(atob(this.getPayload(token)));        
    }
}

export default Token = new Token