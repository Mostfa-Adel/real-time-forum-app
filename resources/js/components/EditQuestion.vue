<template>
    <div>
        <v-container>
            <v-form>
                <v-text-field label="title" v-model="form.title" required>
                </v-text-field>
                <div class="red--text" v-if="validationErrors.title">{{validationErrors.title[0]}}</div>
                
                
                <v-textarea label="body" v-model="form.body" required>
                </v-textarea>
                <div class="red--text" v-if="validationErrors.body">{{validationErrors.body[0]}}</div>
                
                <v-select
                :items="categories"
                item-text="name"
                item-value="id"
                v-model="form.category_id"
                label="category"
                autocomplete
                ></v-select>
                <div class="red--text" v-if="validationErrors.category_id">{{validationErrors.category_id[0]}}</div>

                <div class="red--text" v-if="validationMessage">{{validationMessage}}</div>

                <v-btn @click.prevent="updateQuestion" color="green" type="submit" >
                    Update Question
                </v-btn>
                
            </v-form>
        </v-container>
    </div>
</template>

<script>
export default {
    computed:{},
    data(){
        return{
            form:{
                title:"",
                body:"",
                category_id:0,
            },
            validationErrors:[],
            validationMessage:"",
            categories:[],
            question:{},
        }
    },
    created(){
        
        if(!User.isLoggedIn()){
            this.$router.push({name:"login"})
        }
        this.getCategories()
        this.getQuestion()
        
        
    },

    
    methods:{
        getQuestion(){
            axios.get(`/api/question/${this.$route.params.slug}`)
            .then((response)=>{
                this.question=response.data.question
                this.form.title=this.question.title
                this.form.body=this.question.body
                this.form.category_id=this.question.category_id
            })
            .catch((error)=>{
                console.log(error)
            })
        },

        getCategories(){
            axios.get('/api/category')
            .then(response=>{
                this.categories=response.data.categories
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        
        updateQuestion(){
            // TODO validation

            axios.put(`/api/${this.question.path}`, this.form)
            .then(response=>{
                // this.form={}
                this.$router.push(`/${this.question.path}`)
            })
            .catch((error)=>{
                if(error && error.response){                    
                    this.validationErrors=error.response.data.errors                  
                    this.validationMessage=error.response.data.message
                    } 
                    console.log(error)
            })
        }
    
    }

}
</script>

<style>

</style>