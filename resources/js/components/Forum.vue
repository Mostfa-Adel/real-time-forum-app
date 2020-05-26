<template>

  <v-container fluid grid-list-md>
    <v-layout row wrap>
      <v-flex xs8>
        <v-pagination color="cyan" circle :length="lastPage" v-model="page"></v-pagination>
        <question v-for="(question,i) in questions" :key="question.slug" :index="i" :question="question"></question>
        <h2 v-if="!questions.length">No Questions Yet</h2>
        <v-pagination color="cyan" circle :length="lastPage" v-model="page"></v-pagination>

      </v-flex>
      
      <v-flex xs4>
        <side-bar></side-bar>
      </v-flex>

    </v-layout>
  </v-container>
</template>

<script>
import Question from "./Question"
import sideBar from "./SideBar"
export default {
  components:{Question,sideBar},
  created(){
    this.getQuestions()
    EventBus.$on("questionDeleted", (i)=>{         
      this.questions.splice(i,1)
    })
    EventBus.$on("categorize",(category)=>{
      this.page=1
      this.categorize=category
      this.getQuestions()
    })
  },
  watch:{
    page:function(){
      this.getQuestions()
    },

  },
  data(){
    return{
      questions:[],
      page:1,
      categorize:null,
      totalQuestions:0,
      perPage:0,
      lastPage:1,
    }
  },
  methods:{
    getQuestions(){
      let api=""
      if(this.categorize=='user'){
          api=`/api/user/question?page=${this.page}`
        }else{
          let addCategoryToApi=this.categorize?`/category/${this.categorize}`:""
          api=`/api${addCategoryToApi}/question?page=${this.page}`
      }
      axios.get(api)
      .then((response)=>{
        this.questions=response.data.questions
        this.totalQuestions=response.data.pagination.totalQuestions
        this.perPage=response.data.pagination.perPage
        this.lastPage=response.data.pagination.lastPage
      }).catch((error)=>{
        console.log(error)
      })
    }
  }
}
</script>

<style>

</style>