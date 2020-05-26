import Token from './Token'
import AppStorage from './AppStorage'

class User{

    // login(loginData, loginComponent){
    //     // form validation
    //     axios.post('api/auth/login', loginData)
    //     .then(response=>{
    //         this.handleSuccessLogin(response)
    //         loginComponent.$route.push({name:"Forum"})
    //     })
    //     .catch((error)=>{
    //         if (error && error.response)
    //             loginComponent.formErrors=error.response.data.error
    //         else
    //             console.log(error)
    //     })
        
    // }
    handleSuccessLogin(response){
        if(Token.isValid(response.data.access_token)){
            const data=response.data
            AppStorage.clear()
            AppStorage.store(data.access_token, data.username)
        }

    }
    // signup(loginData, formErrors){
    //     // form validation
    //     axios.post('api/auth/signup', loginData)
    //     .then(response=>this.handleSuccessLogin(response))
    //     .catch((error)=>{
    //         formErrors=error.response.data.errors
    //         console.log(formErrors)
    //     })
        
    // }
    hasToken(){
        const storedToken=AppStorage.getToken()
        if(storedToken){
            return Token.isValid(storedToken)
        }
        return false
    }
    isLoggedIn(){
        return this.hasToken()
    }

    logout(){
        AppStorage.clear()
    }
    ownQuestion(question){        
        return this.id()==question.user_id
    }

    name(){
        return this.isLoggedIn()?AppStorage.getUsername():""
    }

    id(){
        return this.isLoggedIn()?Token.getDecodedPayload(AppStorage.getToken()).sub:0
    }
}

export default User =new User();