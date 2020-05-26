<template>
    
    <v-card style="margin-left:20px">
        <v-toolbar v-if="replies" color="cyan" dark dense class="mt-2">
            <v-toolbar-title>Replies({{replies.length}}):</v-toolbar-title>
        </v-toolbar>
        <v-toolbar v-else color="cyan" dark dense class="mt-2">
            <v-toolbar-title>No Replies Yet</v-toolbar-title>
        </v-toolbar>

            <v-form style="margin:8px">
                <v-textarea rows="2" placeholder="Reply" label="body" v-model="form.body" required>
                </v-textarea>
                <div class="red--text" v-if="validationErrors.body">{{validationErrors.body[0]}}</div>
                
                <div class="red--text" v-if="validationMessage">{{validationMessage}}</div>

                <v-btn v-if="editMode" @click.prevent="updateReply" color="green">
                    Update Reply
                </v-btn>
                <v-btn v-if="editMode" @click.prevent="cancelUpdate" color="green">
                    Cancel
                </v-btn>
                <v-btn v-else @click.prevent="createReply" color="green" type="submit" >
                    Reply
                </v-btn>
                
            </v-form>
                <v-card class="mt-3" v-for="(reply,i) in replies" :key="reply.id">
                    <v-card-title>
                        <div class="headline">{{reply.username}}</div>
                        <div class="ml-2">Said {{reply.created_at}}</div>
                        <v-spacer></v-spacer>
                        <like :reply="reply"></like>

                    </v-card-title>
                    <v-divider></v-divider>

                    <v-card-text v-html="reply.body"></v-card-text>
                    <v-card-actions>
                        <v-btn icon small @click="editReply(i)">
                            <v-icon small color="orange">edit</v-icon>
                        </v-btn>
                        <v-spacer></v-spacer>
                        <v-btn icon small @click="deleteReply(i)">
                            <v-icon small color="red">delete</v-icon>
                        </v-btn>
                    </v-card-actions>
                </v-card>
                
        </v-card>
</template>

<script>
import Like from './Like'

export default {
    components:{Like},
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
            questionSlug:this.$route.params.slug,
            currentReply:null,

        }
    },
    created(){
        
        if(!User.isLoggedIn()){
            this.$router.push({name:"login"})
        }
        this.getReplies()
        
    },
    methods:{
        getReplies(){
            axios.get(`/api/question/${this.questionSlug}/reply`)
            .then(response=>{
                this.replies=response.data.replies
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        
        createReply(){
            // TODO validation
            axios.post(`/api/question/${this.questionSlug}/reply`, this.form)
            .then(response=>{                
                this.replies.unshift(response.data.reply)
                this.form={body:"",id:null}
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
            axios.delete(`/api/question/${this.questionSlug}/reply/${this.replies[index].id}`)
            .then((response)=>{
                this.replies.splice(index,1)
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        editReply(index){
            this.editMode=true
            this.currentReply=this.replies[index]
            this.form.body=this.currentReply.body
            this.id=this.currentReply.id
            
        },
        updateReply(){
            axios.put(`/api/question/${this.questionSlug}/reply/${this.currentReply.id}`,this.form)
            .then((response)=>{                
                //update record in view find it and update it
                let id=this.id
                let i=this.replies.findIndex(function(r){return r.id==id})                
                this.replies[i].body=this.form.body
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