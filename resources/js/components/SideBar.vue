<template>
  <v-card>
      <v-toolbar color="cyan" dark dense class="mt-2">
          <v-toolbar-title>Categories</v-toolbar-title>
      </v-toolbar>
      <v-list>
          <v-list-item >
              <v-list-item-content >
                    <v-btn 
                    @click="emitCategorize(null)"
                    :class="{cyan:selectedCategoryId==null}">
                        <v-list-item-title >No Category</v-list-item-title>
                    </v-btn>
              </v-list-item-content>
          </v-list-item>
          <v-list-item v-if="loggedIn">
              <v-list-item-content >
                    <v-btn 
                    @click="emitCategorize('user')"
                    :class="{cyan:selectedCategoryId=='user'}">
                        <v-list-item-title >My Questions</v-list-item-title>
                    </v-btn>
              </v-list-item-content>
          </v-list-item>
          <v-list-item v-for="category in categories" :key="category.id">
              <v-list-item-content >
                    <v-btn 
                    @click="emitCategorize(category.id)"
                    :class="{cyan:selectedCategoryId==category.id}">
                        <v-list-item-title >{{category.name}}</v-list-item-title>
                    </v-btn>
              </v-list-item-content>
          </v-list-item>
      </v-list>
  </v-card>
</template>

<script>
export default {
    data(){
        return{
            categories:[],
            selectedCategoryId:null,
            loggedIn:User.isLoggedIn(),
        }
    },
    created(){
        
        // if(!User.isLoggedIn()){
        //     this.$router.push({name:"login"})
        // }
        this.getCategories()
        
    },
    methods:{

        getCategories(){
            axios.get('/api/category')
            .then(response=>{
                this.categories=response.data.categories
            })
            .catch((error)=>{
                console.log(error)
            })
        },
        emitCategorize(id){
            this.selectedCategoryId=id
            EventBus.$emit("categorize",id)            
        },
        
    }
}
</script>

<style>

</style>