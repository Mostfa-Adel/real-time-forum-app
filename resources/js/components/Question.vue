<template>
  <v-card class=mt-2>
      <v-card-title>
          <div>
              <router-link :to="question.path"><h3>{{question.title}}</h3></router-link>
              <div style="font-size:15px" class="grey--text">{{question.username}} said {{question.created_at}}</div>
          </div>
      </v-card-title>
      <v-card-text>{{question.body}}</v-card-text>
                            
      <v-card-actions v-if="userOwnQuestion">
            <router-link :to="editRoute">
                <v-btn icon small>
                    <v-icon small color="orange">edit</v-icon>
                </v-btn>
            </router-link>
                <v-spacer></v-spacer>
          <v-btn @click="deleteQuestion" icon small><v-icon small color="red">delete</v-icon></v-btn>
      </v-card-actions>
  </v-card>
</template>

<script>
export default {
    props:['question', 'index'],
    computed:{
        userOwnQuestion(){            
            return User.ownQuestion(this.question)
        },
        editRoute(){
            return `/${this.question.path}/edit`
        }        
    },
    methods:{
        deleteQuestion(){
            axios.delete(`/api/${this.question.path}`)
            .then((response)=>{
                EventBus.$emit("questionDeleted",this.index)
            })
            .catch((error)=>{
                console.log(error)
            })
        }
    }

}
</script>

<style>

</style>