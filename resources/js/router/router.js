import Vue from 'vue';
import VueRouter from 'vue-router';
import login from '../components/Login';
import Signup from '../components/Signup';
import Forum from '../components/Forum';
import ReadQuestion from '../components/ReadQuestion';
import CreateQuestion from '../components/CreateQuestion';
import EditQuestion from '../components/EditQuestion';
import CreateCategory from '../components/CreateCategory';
import Replies from '../components/Replies';

Vue.use(VueRouter);
const routes=[
    {
        path:'/login', 
        component:login,
        name:"login"
    },
    {
        path:'/signup', 
        component:Signup
    },
    {
        path:'/forum', 
        component:Forum,
        name:"forum"
    },
    {
        path:'/question/create', 
        component:CreateQuestion,
        name:"createQuestion"
    },
    {
        path:'/question/:slug', 
        component:ReadQuestion,
        name:"readQuestion"
    },
    {
        path:'/question/:slug/edit', 
        component:EditQuestion,
        name:"editQuestion"
    },
    {
        path:'/category/create', 
        component:CreateCategory,
        name:"createCategory"
    },
    {
        path:'/replies', 
        component:Replies,
        name:"Replies"
    },



]

const router= new VueRouter({
routes,
hashbang:false,
mode:"history"
});

export default router;