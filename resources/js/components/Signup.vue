<template>
    <div>
        <v-container>
            <v-form>
                <v-text-field label="Name" v-model="form.name" required>
                </v-text-field>
                <!-- <span class="red--text"  v-if="formErrors.name">{{formErrors.name[0]}}</span> -->

                <v-text-field type="email" label="Email" v-model="form.email" required>
                </v-text-field>
                <span class="red--text"  v-if="formErrors&&formErrors.email">{{formErrors.email[0]}}</span>


                <v-label for="email"></v-label>


                <v-text-field type="password" label="Password" v-model="form.password" required>
                </v-text-field>
                <span class="red--text"  v-if="formErrors&&formErrors.password">{{formErrors.password[0]}}</span>


                <v-text-field type="password" label="Password Confirmation" v-model="form.password_confirmation" required>
                </v-text-field>
                <span class="red--text"  v-if="formErrors&&formErrors.password_confirmation">{{formErrors.password_confirmation[0]}}</span>


                <v-btn @click.prevent="signup" color="green" type="submit" >
                    Signup
                </v-btn>
                <router-link to="/login">
                    <v-btn color="blue">
                      Login
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
                name:"",
                password_confirmation:"",            
            },
            formErrors:{}
        }
    },
    created(){
        if(User.isLoggedIn()){
            this.$route.push({name:"Forum"})
        }
    },
    methods:{
        signup(){
            // TODO validation
            //login credintials are[alec33@example.com  password]
            //User.signup(this.form, this.formErrors)
            axios.post('api/auth/signup', this.form)
            .then((response)=>{
                User.handleSuccessLogin(response)
                this.$router.push({name:"forum"})
                console.log("eventbus---"+EventBus)
                EventBus.$emit("refreshAuth")
            })
            .catch((error)=>{
                if(error && error.response)
                {
                    this.formErrors=error.response.data.errors
                }
                console.log(error)
            })
        }
    
    }

}
</script>

<style>

</style>