class AppStorage{
    setToken(token){
        localStorage.setItem('token',token);
    }

    setUsername(username){
        localStorage.setItem('username',username);
    }

    store(token, username){
        this.setToken(token);
        this.setUsername(username);
    }

    clear(){
        localStorage.removeItem('token');
        localStorage.removeItem('username');
    }

    getUsername(){
        return localStorage.getItem('username');
    }

    getToken(){
        return localStorage.getItem('token');
    }

}

export default AppStorage=new AppStorage();