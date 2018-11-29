<template>
    <div>
        <t-shirt-card v-for="(tShirt, index) in filteredData" :key="index" :tShirt="tShirt"></t-shirt-card>
        <noTshirt key="No-Tshirt" v-if="filteredData.length === 0"></noTshirt>
    </div>
</template>

<script lang="js">
import { Component, Vue } from 'vue-property-decorator';
import noTshirt from '@/components/T-shirts/noTshirt.vue'; 
import tShirtCard from '@/components/T-shirts/tShirtCard.vue'; 

export default  {
  data(){
    return {
      filteredData: [],
      tShirtz: [
            {brand: "vimeo", src: require('@/assets/t-shirts/1.png'), price: 95, color: "White", checked: false,},
            {brand: "hangry man", src: require('@/assets/t-shirts/2.png'), price: 110, color: "#007da1", checked: false,},
            {brand: "nike", src: require('@/assets/t-shirts/3.png'), price: 20, color: "White", checked: false,},
            {brand: "one & grey", src: require('@/assets/t-shirts/4.png'), price: 270, color: "Grey", checked: false,},
            {brand: "obey", src: require('@/assets/t-shirts/5.png'), price: 30, color: "White", checked: false,},
            {brand: "pinky", src: require('@/assets/t-shirts/6.png'), price: 75, color: "#e4bec1", checked: false,},
            {brand: "white lorem", src: require('@/assets/t-shirts/7.png'), price: 250, color: "White", checked: false,},
            {brand: "new balance", src: require('@/assets/t-shirts/8.png'), price: 115, color: "#d21733", checked: false,},
            {brand: "sprit lorem", src: require('@/assets/t-shirts/9.png'), price: 220, color: "White", checked: false,},
          ],
      price: 270,
    }
  },

  components: {
    't-shirt-card': tShirtCard,
    noTshirt
  },

  computed: {
		selectedFilters () {
        let filters = [];
        let checkedFiters = this.state.tShirtz.filter(obj => obj.checked);
        checkedFiters.forEach(element => {
            filters.push(element.brand);
        });
        return filters;
    },
  },
  
  methods: {
		getfilteredData () {
			this.filteredData = this.tShirtz;
      let filteredDataBrand = [];
      let filteredDataPrice  = [];
			if (this.selectedFilters.length > 0) {
				filteredDataBrand = this.filteredData.filter(obj => this.selectedFilters.includes(obj.brand));
				this.filteredData = filteredDataBrand;
      } 
			if (this.price !== 0) {
        filteredDataPrice = this.filteredData.filter(obj => obj.price <= this.price);
        this.filteredData = filteredDataPrice;
        // console.log("filteredDataPrice =>", filteredDataPrice)
      }
    },
  },
  
	mounted() {
    this.getfilteredData();
  },

  created() {
    this.$ebus.$on("price", payload => {
      this.price = payload;
    });
  },

}
</script>