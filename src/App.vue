<template>
  <div id="app">
    <Header></Header>
    <router-view/>
    <Footer></Footer>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import Header from '@/components/Header/Header.vue';
import Footer from '@/components/Footer/Footer.vue'; 

// @Component
export default {
    data() {
        return{
      
        }
    },
    components: {
      Header,
      Footer,
    }
}
</script>

<style lang="scss">

* {
  box-sizing: border-box;
  font-family: 'Quicksand', 'sans-serif';
  font-weight: 300;
  margin: 0;
  outline: none;
  padding: 0;
  text-decoration: none;
}

//scrollbar
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1; 
}
 
::-webkit-scrollbar-thumb {
    background: rgb(36, 35, 35); 
}

::-webkit-scrollbar-thumb:hover {
    background: rgb(87, 87, 87); 
}

</style>
