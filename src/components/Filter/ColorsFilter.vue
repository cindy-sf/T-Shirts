<template>
   <div>
            <p>Colors :</p>
        <div class="colors" >
            <div v-for="(tShirt, i) in tShirtz" :key="i" v-bind:style="{backgroundColor: tShirt.color}">
       
            </div>
        </div>
   </div>
</template>

<script lang="js">
import { Component, Prop, Vue } from 'vue-property-decorator';
import  { store }  from "@/store/store.js";

export default {
    data(){
        return {
            tShirtz: store.state.tShirtz,
        }
    },
    methods: {
        uniqColor(tShirtz){
            store.uniqColor(tShirtz)
        }
    },
    mounted() {
        // console.log(uniqColor(this.tShirtz,"color"))
    },
}
</script>


<style lang="scss" scoped>
.colors {
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: row;
    justify-content: center;
    // background-color: #000;
    margin: 20px auto;
    div {
        width: 35px;
        height: 35px;
        border: 1px solid;
        border-radius: 50%;
        margin: 0px 2px;
        &:hover {
            cursor: pointer;
        }
    }
}
</style>
