<template>
<v-app-bar
                  color="purple"
                  dense
                  dark
                >
                  <v-app-bar-nav-icon></v-app-bar-nav-icon>

                  <v-toolbar-title>Web Development Forum</v-toolbar-title>

                  <v-spacer></v-spacer>

                  <v-btn icon>
                    <v-icon>mdi-heart</v-icon>
                  </v-btn>
                
                  <v-btn icon>
                    <v-icon>mdi-magnify</v-icon>
                  </v-btn>

                  <router-link v-for="item in navItems" 
                  :key="item.title"
                  :to="item.to"
                  v-if="isLoggedIn==item.showIfLogged || item.title=='Forum'">
                    <v-btn>
                      {{item.title}}
                    </v-btn>
                  </router-link>
                  <v-btn v-if="isLoggedIn" @click="logout">
                      Logout
                  </v-btn>

                  <v-menu
                    left
                    bottom
                  >
                    <template v-slot:activator="{ on }">
                      <v-btn icon v-on="on">
                        <v-icon color="white">mdi-dots-vertical</v-icon>
                      </v-btn>
                    </template>

                    <v-list>
                      <v-list-item
                        v-for="n in 5"
                        :key="n"
                        @click="() => {}"
                      >
                        <v-list-item-title>Option @{{ n }}</v-list-item-title>
                      </v-list-item>
                    </v-list>
                  </v-menu>
                </v-app-bar>  
</template>

<script>
export default {
      data(){
    return{
      isLoggedIn:User.isLoggedIn(),
      navItems:[
        
        {
          title:"Forum",
          to:"/forum",
          showIfLogged:true,
        },
        {
          title:"Ask Question",
          to:"/question/create",
          showIfLogged:true,
        },
        {
          title:"Category",
          to:"/category/create",
          showIfLogged:true,
        },
        {
          title:"Login",
          to:"/login",
          showIfLogged:false,
        },
      ]
    }
  },
  created(){
    EventBus.$on("refreshAuth",()=>{this.isLoggedIn=User.isLoggedIn();console.log(this.isLoggedIn)})
  },

  methods:{
    logout(){
      User.logout()
      this.$router.push({name:"login"})
      EventBus.$emit("refreshAuth")
    }
  }
}
</script>

<style>

</style>