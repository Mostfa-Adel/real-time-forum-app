<template>
    <v-list-item>
        <v-list-item-action>
            <v-btn @click="editCategory(i)" icon small><v-icon small color="orang">edit</v-icon></v-btn>
        </v-list-item-action>
        <v-list-item-content>
            <v-list-item-title>{{category.name}}</v-list-item-title>
        </v-list-item-content>
        <v-list-item-action>
            <v-btn @click="deleteReply(i)" icon small><v-icon small color="red">delete</v-icon></v-btn>
        </v-list-item-action>
    </v-list-item>
</template>

<script>
export default {
    data(){
        return{
            form:{
                body:"",
                id:null
            },
            editMode:false,
            validationErrors:[],
            validationMessage:"",
            replies:[],
            questionSlug:this.$route.params.slug
        }
    },
    created(){
        
        if(!User.isLoggedIn()){
            this.$router.push({name:"login"})
        }
        
    },
    methods:{
        
        
        createReply(){
            // TODO validation
            axios.post('/api/question/${this.slug}/Reply', this.form)
            .then(response=>{                
                this.replies.unshift(response.data.reply)
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
        deleteReply(index){
            axios.delete(`/api/question/${this.slug}/Reply/${this.reply.id}`)
            .then((response)=>{
                this.replies.splice(index)
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        editCategory(index){
            this.editMode=true
            let Reply=this.replies[index]
            this.form.body=this.categories[index].body
            this.id=this.categories[index].id
            
        },
        updateCategory(){
            axios.put(`/api/question/${this.slug}/reply`,this.form)
            .then((response)=>{                
                //update record in view find it and update it
                let id=this.id
                let i=this.categories.findIndex(function(r){return r.id==id})
                console.log(i);
                
                this.categories[i].body=this.form.body
                this.form.body=""
                this.form.id=null
                this.editMode=false
 
            })
            .catch((error)=>{
                //TODO
                console.log(error);
                
            })
        },
        cancelUpdate(index){
            this.form={body:"",id:null}
            this.editMode=false
        }
    }
}
</script>

<style>

</style>