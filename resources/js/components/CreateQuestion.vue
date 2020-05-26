<template>
    <div>
        <v-container>
            <v-form>
                <v-text-field label="title" v-model="form.title" required>
                </v-text-field>
                <div class="red--text" v-if="validationErrors.title">{{validationErrors.title[0]}}</div>
                
                <v-text-field label="slug" v-model="form.slug" required>
                </v-text-field>
                <div class="red--text" v-if="validationErrors.slug">{{validationErrors.slug[0]}}</div>
                
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

                <v-btn @click.prevent="createQuestion" color="green" type="submit" >
                    Create Question
                </v-btn>
                
            </v-form>
        </v-container>
    </div>
</template>

<script>
export default {
    watch:{
        "form.title":function(val){
            this.form.slug=this.slugify(this.form.title)
        },
    },
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
        }
    },
    created(){
        
        if(!User.isLoggedIn()){
            this.$router.push({name:"login"})
        }
        this.getCategories()
        
    },
    methods:{
        slugify(str){
            let newStr=str;
            if(str){
                for (let i= 0; i < newStr.search(" "); i++) {
                    newStr = newStr.replace(" ", "-"); 
                }
            }
            return newStr
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
        
        createQuestion(){
            // TODO validation

            axios.post('/api/question', this.form)
            .then(response=>{
                this.form={}
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