<template>
    <v-container>
        <v-card>
            <v-container fluid>    
                <v-card-title>
                    <div>
                        <div class="headline">{{question.title}}</div>
                        <span style="font-size:15px" class="grey--text">{{question.username}} ({{question.created_at}})</span>
                    </div>
                </v-card-title>
                <v-card-text v-html="question.body"></v-card-text>
                
            </v-container>
        </v-card>
        <Replies :replies=replies></Replies>
        
    </v-container>
</template>

<script>
import Replies from './Replies'

export default {
    components:{Replies},
    created(){
        this.getQuestion()
        this.getReplies()
    },
    methods:{
        getQuestion(){
            axios.get(`/api/question/${this.$route.params.slug}`)
            .then((response)=>{
                this.question=response.data.question
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        getReplies(){
            axios.get(`/api/question/${this.$route.params.slug}/reply`)
            .then((response)=>{
                this.replies=response.data.replies
            })
            .catch((error)=>{
                console.log(error)
            })
        }
    },
    data(){
        return{
            question:{},
            replies:[],
        }
    },
}
</script>

<style>

</style>