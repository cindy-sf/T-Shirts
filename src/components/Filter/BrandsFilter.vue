<template>
	    <div>
			<input type="checkbox" v-model="tShirt.checked" @change="$emit('filtre-brand')">
			<label>
				{{ tShirt.brand }}
			</label>
	</div>
</template>

<script>
import { Component, Prop, Vue } from 'vue-property-decorator';

export default {

    props:  ['tShirt'],

}

</script>


<style lang="scss" scoped>

div {
    margin: 0px 7px;
}

label {
    text-transform: capitalize;
}

input[type="checkbox"] {
  width: 13px;
  height: 13px;
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  appearance: none;
  border: 1px solid grey;
  border-radius: 50%;
  vertical-align: middle;
  background-image: url("../../assets/filter/checked2.svg");
	background-repeat:no-repeat;
	background-size:contain;
	background-color:#fff;
	background-position:50% 50%;
  background-size:0 0;
  transition:.3s  ease;
}

// input[type="checkbox"]:active {
//    background-color: darkgrey;
// }

input[type="checkbox"]:checked {
  background-size:100% 100%;
  background-color: #c0c0c0;
}

</style>
