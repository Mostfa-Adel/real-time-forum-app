<template>
    <div>
        <v-container>
            <v-form>
                <v-text-field label="name" v-model="form.name" required>
                </v-text-field>
                <div class="red--text" v-if="validationErrors.name">{{validationErrors.name[0]}}</div>
                
                <div class="red--text" v-if="validationMessage">{{validationMessage}}</div>

                <v-btn v-if="editMode" @click.prevent="updateCategory" color="green">
                    Update Category
                </v-btn>
                <v-btn v-if="editMode" @click.prevent="cancelUpdate" color="green">
                    Cancel
                </v-btn>
                <v-btn v-else @click.prevent="createCategory" color="green" type="submit" >
                    Create Category
                </v-btn>
                
            </v-form>

            <v-card>
                <v-toolbar color="cyan" dark dense class="mt-2">
                    <v-toolbar-title>Categories</v-toolbar-title>
                </v-toolbar>
                <v-list>
                    <v-list-item v-for="(category, i) in categories" :key="category.id">
                        <v-list-item-action>
                            <v-btn @click="editCategory(i)" icon small><v-icon small color="orange">edit</v-icon></v-btn>
                        </v-list-item-action>
                        <v-list-item-content>
                            <v-list-item-title>{{category.name}}</v-list-item-title>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-btn @click="deleteCategory(i)" icon small><v-icon small color="red">delete</v-icon></v-btn>
                        </v-list-item-action>
                    </v-list-item>
                </v-list>
            </v-card>
        </v-container>
    </div>
</template>

<script>

export default {
    watch:{
        "form.name":function(val){
            this.form.slug=this.slugify(this.form.name)
        },
    },
    computed:{},
    data(){
        return{
            form:{
                name:"",
                slug:"",
            },
            slug:"",
            editMode:false,
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
        createCategory(){
            // TODO validation
            axios.post('/api/category', this.form)
            .then(response=>{                
                this.categories.unshift(response.data.category)
                this.form={}
                this.validationErrors=[]
                this.validationMessage=""
            })
            .catch((error)=>{
                if(error && error.response){                    
                    this.validationErrors=error.response.data.errors                  
                    this.validationMessage=error.response.data.message
                    } 
                console.log(error)
            })
        },
        deleteCategory(index){
            axios.delete(`/api/category/${this.categories[index].slug}`)
            .then((response)=>{
                this.categories.splice(index)
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        editCategory(index){
            this.editMode=true
            let category=this.categories[index]
            this.form.name=this.categories[index].name
            this.slug=this.categories[index].slug
            
        },
        updateCategory(){
            axios.put(`/api/category/${this.slug}`,this.form)
            .then((response)=>{                
                //update record in view find it and update it
                let slug=this.slug
                let i=this.categories.findIndex(function(c){return c.slug==slug})
                console.log(i);
                
                this.categories[i].name=this.form.name
                // this.categories[i].slug=this.slug
                this.form.name=""
                this.form.slug=""
                this.slug=""
                this.editMode=false
 
            })
            .catch((error)=>{
                //TODO
                console.log(error);
                
            })
        },
        cancelUpdate(index){
            this.form={name:"",slug:""}
            this.editMode=false
        }
    }
}
</script>

<style>

</style>