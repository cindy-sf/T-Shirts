<template>

    <transition-group name="fade" tag="div" class="wrapper">
      <show-filter key="showfilter" @show-filters="showFilters"></show-filter>
      <reset-button v-if="show" @reset-filter="reset" key="button"></reset-button>
      <brands-filter v-if="show" v-for="(tShirt) in tShirtz" :key="tShirt.reference" :tShirt="tShirt" @filtre-brand="getfilteredData"></brands-filter>
      <price-filter v-if="show" key="PriceFilter" @filtre-price="getfilteredData"></price-filter>
      <t-shirt-card v-for="(tShirt, index) in filteredData" :key="index" :tShirt="tShirt"></t-shirt-card>
      <no-tshirt key="No-Tshirt" v-if="filteredData.length === 0"></no-tshirt> 
      <!-- <ul v-for="(une, index) in unique" :key="index">
        <li>{{ unique[index] }}</li>
      </ul> -->
    </transition-group>

</template>

<script lang="js">
import { Component, Vue } from 'vue-property-decorator';
import BrandsFilter from '@/components/Filter/BrandsFilter.vue';
import noTshirt from '@/components/T-shirts/noTshirt.vue'; 
import PriceFilter from '@/components/Filter/PriceFilter.vue';
import tShirtCard from '@/components/T-shirts/tShirtCard.vue'; 
import ResetButton from '@/components/Filter/ResetButton.vue';
import showFilter from '@/components/Filter/showFilter.vue';
import axios from "axios";

export default  {
  data(){
    return {
      filteredData: [],
      tShirtz: [],
      price: 270,
      show: false,
      text: 'Afficher les filtres',
      icon: 'fas fa-angle-down',
      unique: [],
    }
  },

  components: {
    tShirtCard,
    BrandsFilter,
    PriceFilter,
    noTshirt,
    ResetButton,
    showFilter,
  },

  computed: {
		selectedFilters () {
        let filters = [];
        let checkedFiters = this.tShirtz.filter(obj => obj.checked);
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
      }
    },

    getTshirts () {
    const url= "http://localhost:3030/api/products";
      axios.get(url).then(res => {
          this.tShirtz = res.data;
          this.getfilteredData();
          this.getUniqueBrand(this.tShirtz); 
        })
        .catch(err => {
          console.log(err)
        })
    },

    reset() {
      Object.assign(this.$data, this.$options.data())
      this.getfilteredData();
      this.getTshirts();
      this.show = true;
    },

    getUniqueBrand (arr) {
      this.unique = [...new Set(arr.map(item => item.brand))];
      // console.log("unique", unique)
      for (let index = 0; index < this.unique.length; index++) {
        const element = this.unique[index];
        // console.log(element)
      }
      return this.unique;
    },
    
    showFilters() {
      this.show ^= true;
      this.text = this.show ? 'Masquer les filtres' : 'Afficher les filtres';
      this.icon = this.show ? 'fas fa-angle-up' : 'fas fa-angle-down';
    }
  },
  
	mounted() {
    this.getfilteredData();
  },

  updated() {
    // console.log(this.tShirtz)
    this.$ebus.$on("price", payload => {
      this.price = payload;
    });
    this.$ebus.$emit('text-content', this.text);
    this.$ebus.$emit('icon', this.icon);
  },

  created() {
    this.getTshirts();
    // console.log(this.tShirtz)
    
  },

}
</script>

<style lang="scss" scoped>

.wrapper {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  padding-top: 90px;
  width: 900px;
  height: auto;
  margin: auto;
}

.form-check-label {
  text-transform: capitalize;
}

.form-check{
  margin: 5px;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}

.fade-enter, .fade-leave-to {
  opacity: 0;
}

.img {
  width: 50px;
  height: 50px;
}

</style>