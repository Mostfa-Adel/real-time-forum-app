<template>
    <div>
        <v-container>
            <v-form>
                <v-text-field type="email" label="Email" v-model="form.email" required>
                </v-text-field>
                <v-label for="email"></v-label>
                <v-text-field type="password" label="Password" v-model="form.password" required>
                </v-text-field>
                <span v-if="formErrors.message">{{formErrors.message}}</span>

                <v-btn @click.prevent="login" color="green" type="submit" >
                    Login
                </v-btn>
                <router-link to="/signup">
                    <v-btn color="blue">
                      Signup
                    </v-btn>
                </router-link>
            </v-form>
        </v-container>
    </div>
</template>

<script>
export default {
    data(){
        return{
            form:{
                email:"",
                password:"",
            },
            formErrors:{
                message:null,
                error:null
            },
        }
    },
    created(){
        
        if(User.isLoggedIn()){
            this.$router.push({name:"forum"})
        }
    },
    methods:{
        login(){
            // TODO validation
            //login credintials are[alec33@example.com  password]
            // User.login(this.form)

            axios.post('api/auth/login', this.form)
            .then(response=>{
                User.handleSuccessLogin(response)
                this.$router.push({name:"forum"})
                EventBus.$emit("refreshAuth")
            })
            .catch((error)=>{
                if(error && error.response){
                    this.formErrors.error=error.response.data.error                    
                    this.formErrors.message=error.response.data[0].message
                    } 
                else
                    console.log(error)
            })
        }
    
    }

}
</script>

<style>

</style>