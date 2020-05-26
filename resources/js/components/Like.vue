<template>
    <v-btn icon small @click="handleLikeReply">
        <v-icon :color="userLikedIt?'red':'grey'">favorite</v-icon>{{likesCount}}
    </v-btn>
</template>

<script>
export default {
    props:['reply'],
    created(){
    },

    data(){
        return{
            likesCount:this.reply.likes.length,
            userLikedIt:this.reply.userLikedIt,
        }
    },
    methods:{
        handleLikeReply(){
            if (this.userLikedIt) {
                this.dislikeReply()
            }else
                this.likeReply()

        },

        likeReply(){
            axios.post(`/api/reply/${this.reply.id}/like`)
            .then((response)=>{
                this.likesCount++
                this.userLikedIt=true
            })
            .catch((error)=>{
                console.log(error)
            })
        },

        dislikeReply(){
            axios.delete(`/api/reply/${this.reply.id}/like`)
            .then((response)=>{
                this.likesCount--
                this.userLikedIt=false
            })
            .catch((error)=>{
                console.log(error)
            })

        }
    },

}
</script>

<style>

</style>