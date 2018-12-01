<template>
    <div>
        <input type="range" v-model="price" min="20" max="270" @change="$emit('filtre-price')">
        <p>{{ price }} $</p>
    </div>
</template>

<script lang="js">
import { Component, Prop, Vue } from 'vue-property-decorator';

export default {
    data() {
        return{
            price: 270,
        }
    },

    updated() {
        this.$ebus.$emit("price", this.price);
    },
    
    created() {
      this.$ebus.$on("reset", payload => {
      this.price = 270;
    });
  }

}
</script>

<style lang="scss" scoped>

div {
    width: 100%;
    height: 50px;
    position: relative;
    margin: auto;
}

input[type="range"] {
  -webkit-appearance:none;
  width:100px;
  height:2px;
  background: #000;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%);
}

input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance:none;
  width:13px;
  height:13px;
  border-radius: 100%;
  background: #000;
  border: 3px solid #000;
  z-index:3;
  cursor: pointer;
}

p {
    margin-top: 35px;
    text-align: center;
}

</style>
